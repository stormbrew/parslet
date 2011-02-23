require 'spec_helper'

describe Parslet::Optimizer do
  include Parslet
  
  def optimize(parslet)
    subject.apply(parslet)
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
  context "when applied to mixed sequences" do
    let(:parslet) { str('a') >> match['b'] >> str('c').as(:d) }
    subject { parslet }
    
    it { should parse('abc') }
  end
end