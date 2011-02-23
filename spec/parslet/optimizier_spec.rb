require 'spec_helper'

describe Parslet::Optimizer do
  include Parslet
  
  let(:optimizer) { described_class.new }
  def optimize(parslet)
    optimizer.apply(parslet)
  end
  
  # Constructs an entity on the fly. 
  def entity(name, &block)
    Parslet::Atoms::Entity.new(name.to_s, &block)
  end
  
  context "when applied to sequences of strings" do
    let(:parslet) { str('a') >> str('b') }
    
    it "should turn into one big string" do
      optimize(parslet).should == str('ab')
    end 
    it "should parse 'ab'" do
      optimize(parslet).should parse('ab')
    end 
  end
  context "when applied to entities that are just strings internally" do
    let(:parslet) { entity(:a) { str('foo') } >> entity(:b) { str('bar') } }
    subject { optimize(parslet) }
    
    it { should == str('foobar') }
  end
  context "when applied to mixed sequences" do
    let(:parslet) { str('a') >> match['b'] >> str('c').as(:d) }
    subject { parslet }
    
    it { should parse('abc') }
  end
end