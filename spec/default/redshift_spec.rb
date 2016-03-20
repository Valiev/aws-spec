require "spec_helper"

describe "Redshift" do
  before do
    @redshift = Aws::Redshift::Client.new
  end

  describe "Clusters" do
    subject { @redshift.describe_clusters.clusters.count }
    it { is_expected.to eq(0) }
  end

end
