require_relative "../spec_helper"

describe "EC2" do

  before do
    @client = Aws::EC2::Client.new
    @ec2 = Aws::EC2::Resource.new(client: @client)
    @number_of_az = @client.describe_availability_zones.availability_zones.count
  end

  describe "VPCs" do
    subject { @ec2.vpcs.count }
    it { is_expected.to eq(3) }
  end

  describe "Subnets" do
    subject { @ec2.subnets.count }
    it { is_expected.to eq(@number_of_az) }
  end

  describe "VPN Gateways" do
    subject { @client.describe_vpn_gateways.vpn_gateways.count }
    it { is_expected.to eq(0) }
  end

  describe "Internet Gateways" do
    subject { @ec2.internet_gateways.count }
    it { is_expected.to eq(0) }
  end

  describe "Customer Gateways" do
    subject { @client.describe_customer_gateways.customer_gateways.count }
    it { is_expected.to eq(0) }
  end

  describe "VPN Connections" do
    subject { @client.describe_vpn_connections.vpn_connections.count }
    it { is_expected.to eq(0) }
  end

  describe "Network ACLs" do
    subject { @ec2.network_acls.count }
    it { is_expected.to eq(1) }
  end

  describe "Route Tables" do
    subject { @ec2.route_tables.count }
    it { is_expected.to eq(1) }
  end

  describe "DHCP Optinos" do
    subject { @client.describe_dhcp_options.dhcp_options.count }
    it { is_expected.to eq(1) }
  end

  describe "Instances" do
    subject { @ec2.instances.count }
    it { is_expected.to eq(0) }
  end

  describe "Volumes" do
    subject { @ec2.volumes.count }
    it { is_expected.to eq(0) }
  end

  describe "Elastic IPs" do
    subject { @client.describe_addresses.addresses.count }
    it { is_expected.to eq(0) }
  end

  describe "Key Pairs" do
    subject { @ec2.key_pairs.count }
    it { is_expected.to eq(0) }
  end

  describe "Snapshots" do
    subject { @ec2.snapshots(filters: [name: "owner-alias", values: ["self"]]).count }
    it { is_expected.to eq(0) }
  end

  describe "Security Group" do
    subject { @ec2.security_groups.count }
    it { is_expected.to eq(1) }
  end

end
