# frozen_string_literal: true

module AJAX
  module Curb
    class RpsController < AJAX::BaseController
      def judge
        operation = Operations::RockPaperScissors::Judge.new(user_bet: params[:user_bet])
        result = operation.call

        render json: { result: result }
      end
    end
  end
end
