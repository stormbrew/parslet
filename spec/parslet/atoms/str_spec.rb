require 'spec_helper'

describe Parslet::Atoms::Str do
  include Parslet
  let(:foo) { str('foo') }
  let(:bar) { str('bar') }
  
  describe "<- foo ==" do
    subject { foo }
    
    it { should == foo }
    it { should == str('foo') }
    it { should_not == bar }
  end
end