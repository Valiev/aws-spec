require "spec_helper"

describe "ELB" do
  before do
    @elasticloadbalancing = Aws::ElasticLoadBalancing::Client.new
  end

  describe "Load Balancers" do
    subject { @elasticloadbalancing.describe_load_balancers.load_balancer_descriptions.count }
    it { is_expected.to eq(0) }
  end

end
