# frozen_string_literal: true

require "rails_helper"

RSpec.describe Integrations::Curb::RockPaperScissors::Throw do
  describe "#call" do
    context "when response with 200 STATUS" do
      it "returns bet" do
        stub_request(:get, "http://curb.com/test")
          .to_return(status: 200, body: {statusCode: 200, body: "rock"}.to_json)

        expected_response = JSON.parse(described_class.new.call, symbolize_names: true)
        expect(expected_response[:body]).to eq("rock")
      end
    end

    context "when curb response with 500x STATUS" do
      it "returns local bet" do
        stub_request(:get, "http://curb.com/test")
          .to_return(status: 500, body: {statusCode: 500, body: "error"}.to_json)

          allow(subject).to receive(:fallback_throw).and_return("rock")

        expect(subject.call).to eq("rock")
      end
    end
  end
end
