require 'spec_helper'

describe Parslet::Atoms::Sequence do
  let(:sequence) { described_class.new }

  describe "comparison operators" do
    describe "<- #==" do
      include Parslet
      let(:seq) { described_class.new(str('foo'), str('bar')) }
      subject { seq }
      
      it { should == seq }
      it { should == (str('foo')>>str('bar')) }
      it { should_not == described_class.new(str('foo')) }
      it { should_not == str('foo') }
    end
  end
  describe "<- #error_tree" do
    context "when no error has been produced" do
      subject { sequence.error_tree }  
      
      its(:children) { should be_empty }
    end
  end
end