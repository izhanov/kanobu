# frozen_string_literal: true

require "rails_helper"

RSpec.describe Operations::RockPaperScissors::Judge do
  describe "#call" do
    before do
      allow_any_instance_of(Integrations::Curb::RockPaperScissors::Throw).to(
        receive(:call).and_return({ "statusCode": 200, "body": "paper" })
      )
    end

    context "when user fail" do
      it "returns curb bet and message" do
        stub_request(:get, "http://curb.com/test")
          .to_return(status: 200, body: {statusCode: 200, body: "paper"}.to_json)

        result = described_class.new(user_bet: "rock").call

        expect(result).to eq({ curb_bet: "paper", message: "You lose!", status: "lose" })
      end
    end

    context "when user win" do
      it "returns curb bet and message" do
        stub_request(:get, "http://curb.com/test")
          .to_return(status: 200, body: {statusCode: 200, body: "paper"}.to_json)

        result = described_class.new(user_bet: "scissors").call

        expect(result).to eq({ curb_bet: "paper", message: "You win!", status: "win" })
      end
    end
  end
end
