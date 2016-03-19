require "spec_helper"

describe "CloudFront" do
  before do
    @cloudfront = Aws::CloudFront::Client.new
  end

  describe "Distributions" do
    subject { @cloudfront.list_distributions.distribution_list.items.count }
    it { is_expected.to eq(0) }
  end

end
