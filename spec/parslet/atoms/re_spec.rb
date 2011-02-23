require 'spec_helper'

describe Parslet::Atoms::Re do
  describe "construction" do
    include Parslet
    
    it "should allow match(str) form" do
      match('[a]').should be_a(Parslet::Atoms::Re)
    end 
    it "should allow match[str] form" do
      match['a'].should be_a(Parslet::Atoms::Re)
    end 
  end
  describe "comparison operators" do
    include Parslet
    let(:re) { match['abc'] }
    subject { re }
    
    it { should == re }
    it { should == match['abc'] }
    it { should_not == match['bcd'] }
  end
end