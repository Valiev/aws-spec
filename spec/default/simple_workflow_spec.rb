require "spec_helper"

describe "SimpleWorkflow" do
  before do
    @swf = Aws::SWF::Client.new
  end

  describe "Registered Domains" do
    subject { @swf.list_domains(registration_status: "REGISTERED").domain_infos.count }
    it { is_expected.to eq(0) }
  end

  describe "Deprecated Domains" do
    subject { @swf.list_domains(registration_status: "DEPRECATED").domain_infos.count }
    it { is_expected.to eq(0) }
  end

end
