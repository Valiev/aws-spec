require "spec_helper"

describe "SQS" do
  before do
    @sqs = Aws::SQS::Client.new
  end

  describe "Queues" do
    subject { @sqs.list_queues.queue_urls.count }
    it { is_expected.to eq(0) }
  end

end
