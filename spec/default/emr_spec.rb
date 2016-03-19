require "spec_helper"

describe "EMR" do
  before do
    @emr = Aws::EMR::Client.new
  end

  describe "Clusters" do
    subject { @emr.list_clusters.clusters.count }
    it { is_expected.to eq(0) }
  end

end
