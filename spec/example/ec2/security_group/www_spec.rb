require "spec_helper"

describe "Security Group" do

  let(:inbound) { [
    Aws::EC2::Types::IpPermission.new(
      ip_protocol: "-1",
      from_port: nil,
      to_port: nil,
      user_id_group_pairs: [
        Aws::EC2::Types::UserIdGroupPair.new(
          user_id: "999999999999",
          group_name: nil,
          group_id: "sg-xxxxxxxx",
          vpc_id: nil,
          vpc_peering_connection_id: nil,
          peering_status: nil
        )
      ],
      ip_ranges: [],
      prefix_list_ids: []
    ),
    Aws::EC2::Types::IpPermission.new(
      ip_protocol: "tcp",
      from_port: 22,
      to_port: 22,
      user_id_group_pairs: [],
      ip_ranges: [
        Aws::EC2::Types::IpRange.new(cidr_ip: "xxx.xxx.xxx.xxx/32")
      ],
      prefix_list_ids: []
    )
  ] }

  let(:outbound) { [
    Aws::EC2::Types::IpPermission.new(
      ip_protocol: "-1",
      from_port: nil,
      to_port: nil,
      user_id_group_pairs: [],
      ip_ranges: [
        Aws::EC2::Types::IpRange.new(cidr_ip: "0.0.0.0/0")
      ],
      prefix_list_ids: []
    )
  ] }

  before :all do
    @ec2 = Aws::EC2::Resource.new
    name = File.basename(__FILE__).split("_spec.rb").first
    @security_group = @ec2.security_groups.find { |s| s.group_name == name }
  end

  describe "Security Group" do
    subject { @security_group }
    it { is_expected.to be_truthy }
  end

  describe "VPC ID: vpc-6301ee06" do
    subject { @security_group.vpc_id }
    it { is_expected.to eq("vpc-xxxxxxxx") }
  end

  describe "Inbound" do
    subject { @security_group.ip_permissions }
    it { is_expected.to eq(inbound) }
  end

  describe "Outbound" do
    subject { @security_group.ip_permissions_egress }
    it { is_expected.to eq(outbound) }
  end

end
