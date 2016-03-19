require "spec_helper"

describe "SimpleDB" do
  before do
    @simpledb = Aws::SimpleDB::Client.new
  end

  describe "Domains" do
    subject { @simpledb.list_domains.domain_names.count }
    it { is_expected.to eq(0) }
  end

end
