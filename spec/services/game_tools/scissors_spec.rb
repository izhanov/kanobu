# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameTools::Scissors do
  describe "#to_s" do
    it "returns scissors" do
      expect(subject.to_s).to eq("scissors")
    end
  end

  describe "#==(other)" do
    context "when other is scissors" do
      it "returns true" do
        expect(subject == described_class.new).to eq(true)
      end
    end

    context "when other is not scissors" do
      it "returns false" do
        expect(subject == GameTools::Paper.new).to eq(false)
      end
    end
  end

  describe "#>(other)" do
    context "when other is paper" do
      it "returns true" do
        expect(subject > GameTools::Paper.new).to eq(true)
      end
    end

    context "when other is not paper" do
      it "returns false" do
        expect(subject > GameTools::Scissors.new).to eq(false)
      end
    end
  end

  describe "#<(other)" do
    context "when other is rock" do
      it "returns true" do
        expect(subject < GameTools::Rock.new).to eq(true)
      end
    end

    context "when other is not rock" do
      it "returns false" do
        expect(subject < GameTools::Paper.new).to eq(false)
      end
    end
  end
end
