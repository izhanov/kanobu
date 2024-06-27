# frozen_string_literal: true

require "rails_helper"


RSpec.describe GameTools::Hammer do
  describe "#to_s" do
    it "returns hammer string" do
      expect(subject.to_s).to eq("hammer")
    end
  end

  describe "#==(other)" do
    context "when other is hammer" do
      it "returns true" do
        expect(subject == described_class.new).to eq(true)
      end
    end

    context "when other is not hammer" do
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

    context "when other is scissors" do
      it "returns true" do
        expect(subject > GameTools::Scissors.new).to eq(true)
      end
    end

    context "when is paper" do
      it "returns false" do
        expect(subject > GameTools::Paper.new).to eq(false)
      end
    end
  end

  describe "#<(other)" do
    context "when other is paper" do
      it "returns true" do
        expect(subject < GameTools::Paper.new).to eq(true)
      end
    end

    context "when other is rock" do
      it "returns false" do
        expect(subject < GameTools::Rock.new).to eq(false)
      end
    end

    context "when other is scissors" do
      it "returns false" do
        expect(subject < GameTools::Scissors.new).to eq(false)
      end
    end
  end
end
