# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameTools::Paper do
  describe "#to_s" do
    it "returns paper" do
      expect(subject.to_s).to eq("paper")
    end
  end

  describe "#==(other)" do
    context "when other is paper" do
      it "returns true" do
        expect(subject == described_class.new).to eq(true)
      end
    end

    context "when other is not paper" do
      it "returns false" do
        expect(subject == GameTools::Rock.new).to eq(false)
      end
    end
  end

  describe "#>(other)" do
    context "when other is rock" do
      it "returns true" do
        expect(subject > GameTools::Rock.new).to eq(true)
      end
    end

    context "when other is not rock" do
      it "returns false" do
        expect(subject > GameTools::Paper.new).to eq(false)
      end
    end
  end

  describe "#<(other)" do
    context "when other is scissors" do
      it "returns true" do
        expect(subject < GameTools::Scissors.new).to eq(true)
      end
    end

    context "when other is not scissors" do
      it "returns false" do
        expect(subject < GameTools::Rock.new).to eq(false)
      end
    end
  end
end
