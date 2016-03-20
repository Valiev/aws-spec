require "spec_helper"

describe "AutoScaling" do

  before do
    @autoscaling = Aws::AutoScaling::Resource.new
  end

  describe "Auto Scaling Groups" do
    subject { @autoscaling.groups.count }
    it { is_expected.to eq(0) }
  end

  describe "Launch Configurations" do
    subject { @autoscaling.launch_configurations.count }
    it { is_expected.to eq(0) }
  end

  describe "Scheduled Actions" do
    subject { @autoscaling.scheduled_actions.count }
    it { is_expected.to eq(0) }
  end

end
