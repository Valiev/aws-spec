require "spec_helper"

describe "S3" do
  before do
    @s3 = Aws::S3::Resource.new
  end

  describe "Buckets" do
    subject { @s3.buckets.count }
    it { is_expected.to eq(0) }
  end

end
