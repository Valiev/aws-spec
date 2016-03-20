require "spec_helper"

describe "DynamoDB" do
  before do
    @dynamodb = Aws::DynamoDB::Client.new
  end

  describe "Tables" do
    subject { @dynamodb.list_tables.table_names.count }
    it { is_expected.to eq(0) }
  end

end
