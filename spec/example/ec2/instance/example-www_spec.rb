require "spec_helper"

describe "EC2" do
  before :all do
    @ec2 = Aws::EC2::Resource.new
    name = File.basename(__FILE__).split("_spec.rb").first
    @instance = @ec2.instances(filters: [name: "tag:Name", values: [name]]).first
  end

  describe "instance" do
    subject { @instance }
    it { is_expected.to be_truthy }
  end

  describe "Root Volume" do
    before do
      @volume = @instance.volumes.find { |v|
        v.attachments.find { |a| a.device == @instance.root_device_name }
      }
    end

    describe "Delete on Termination" do
      subject { @volume.attachments[0].delete_on_termination }
      it { is_expected.to be_truthy }
    end

    describe "IOPS" do
      subject { @volume.iops }
      it { is_expected.to eq(24) }
    end

    describe "Size" do
      subject { @volume.size }
      it { is_expected.to eq(8) }
    end
  end

  describe "Security Groups" do
    subject { @instance.security_groups.first.group_name }
    it { is_expected.to eq("default") }
  end

  describe "Private IP Address" do
    subject { @instance.private_ip_address }
    it { is_expected.to eq("xxx.xxx.xxx.xxx") }
  end

  describe "Public IP Address" do
    subject { @instance.public_ip_address }
    it { is_expected.to eq("xxx.xxx.xxx.xxx") }
  end

  describe "Instance Type" do
    subject { @instance.instance_type }
    it { is_expected.to eq("t2.nano") }
  end

  describe "AMI Name" do
    subject { @instance.image_id }
    it { is_expected.to eq("ami-xxxxxxxx") }
  end

end
