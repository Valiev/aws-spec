require "spec_helper"

describe "Route53" do
  before do
    @route53 = Aws::Route53::Client.new
  end

  describe "Hosted Zones" do
    subject { @route53.list_hosted_zones.hosted_zones.count }
    it { is_expected.to eq(0) }
  end

end
