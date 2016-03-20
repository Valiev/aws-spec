require "spec_helper"

describe "CloudFormation" do
  before do
    @cloudformation = Aws::CloudFormation::Resource.new
  end

  describe "Stacks" do
    subject { @cloudformation.stacks.count }
    it { is_expected.to eq(0) }
  end

end
