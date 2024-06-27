# frozen_string_literal: true

module Operations
  module RockPaperScissors
    class Judge
      attr_reader :user_bet

      def initialize(user_bet:)
        @user_bet = "GameTools::#{user_bet.capitalize}".constantize.new
      end

      def call
        curb_response = curb_bet_response[:body]

        curb_bet = "GameTools::#{curb_response.capitalize}".constantize.new

        if user_bet == curb_bet
          { curb_bet: curb_bet.to_s, message: "It's a tie!", status: "tie"}
        elsif user_bet > curb_bet
          { curb_bet: curb_bet.to_s, message: "You win!", status: "win"}
        elsif user_bet < curb_bet
          { curb_bet: curb_bet.to_s, message: "You lose!", status: "lose"}
        end
      end

      private

      def curb_bet_response
        @curb_bet_response ||= Integrations::Curb::RockPaperScissors::Throw.new.call.deep_symbolize_keys
      end
    end
  end
end
