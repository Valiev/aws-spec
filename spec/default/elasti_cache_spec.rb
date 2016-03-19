require "spec_helper"

describe "ElastiCache" do
  before do
    @elasticache = Aws::ElastiCache::Client.new
  end

  describe "Clusters" do
    subject { @elasticache.describe_cache_clusters[:cache_clusters].count }
    it { is_expected.to eq(0) }
  end

end
