require "spec_helper"

describe "RDS" do
  before do
    @rds = Aws::RDS::Resource.new
  end

  describe "DB Instances" do
    subject { @rds.db_instances.count }
    it { is_expected.to eq(0) }
  end

end
