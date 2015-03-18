require "active_support/core_ext/object/to_query"

RSpec.describe Docomoru::Client do
  let(:client) do
    described_class.new(api_key: api_key)
  end

  let(:api_key) do
    "dummy"
  end

  describe "#create_dialogue" do
    subject do
      client.create_dialogue(message)
    end

    let(:message) do
      "test"
    end

    let!(:stubbed_request) do
      stub_request(
        :post,
        "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?" + {
          APIKEY: api_key,
        }.to_query,
      ).with(
        body: {
          utt: message,
        },
      )
    end

    it "sends HTTP request with given message and API key to Dialogue API" do
      is_expected.to be_a Docomoru::Response
      expect(stubbed_request).to have_been_requested
    end
  end

  describe "#create_knowledge" do
    subject do
      client.create_knowledge(message)
    end

    let(:message) do
      "test"
    end

    let!(:stubbed_request) do
      stub_request(
        :get,
        "https://api.apigw.smt.docomo.ne.jp/knowledgeQA/v1/ask?" + {
          APIKEY: api_key,
          q: message,
        }.to_query,
      )
    end

    it "sends HTTP request with given message and API key to Knowledge API" do
      is_expected.to be_a Docomoru::Response
      expect(stubbed_request).to have_been_requested
    end
  end
end
