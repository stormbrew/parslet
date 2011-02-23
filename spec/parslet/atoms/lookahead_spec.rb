require 'spec_helper'

describe Parslet::Atoms::Lookahead do
  include Parslet
  let(:lookahead) { str('foo').absnt? }

  describe "comparison operators" do
    describe "<- #==" do
      subject { lookahead }
      
      it { should == lookahead }
      it { should == str('foo').absnt? }
      it { should_not == str('foo').prsnt? }
      it { should_not == str('bar').absnt? }
    end
  end
end