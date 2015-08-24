require_relative "../spec_helper"

describe LogStash::Outputs::PagerDuty do

  it "should register without errors" do
    plugin = LogStash::Plugin.lookup("output", "pagerduty").new("service_key" => "")
    expect { plugin.register }.to_not raise_error
  end

  describe "#send" do
    subject          { LogStash::Outputs::PagerDuty.new( "service_key" => "my_service_key" ) }
    let(:properties) { { "message" => "This is a message!" } }
    let(:event)      { LogStash::Event.new(properties) }
    let(:logger)     { subject.logger }

    before(:each) do
      subject.register
    end

    it "send the event to pagerduty" do
      stub_request(:post, /#{subject.pdurl}/).
        to_return(status: 200, body: "stubbed response", headers: {})
      expect(logger).to receive(:debug).with("PD Response", :response => "stubbed response").once
      expect(logger).to receive(:debug).with("PD Request", kind_of(Hash)).once
      expect(logger).to receive(:debug).with("PD Details added:", kind_of(Hash)).twice
      subject.receive(event)
    end

  end
end
