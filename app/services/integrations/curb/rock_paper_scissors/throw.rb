# frozen_string_literal: true

module Integrations
  module Curb
    module RockPaperScissors
      class Throw

        def call
          response = conn.get(
            SETTINGS[:integrations][:curb][:url]
          )

          response.body
        rescue Faraday::Error => e
          fallback_throw
        end

        private

        def conn
          options = {
            timeout: 2,
            open_timeout: 1,
            read_timeout: 1,
            write_timeout: 1
          }
          Faraday.new() do |faraday|
            faraday.request :json
            faraday.response :json
            faraday.response :raise_error
          end
        end

        def fallback_throw
          %w[rock paper scissors].sample
        end
      end
    end
  end
end
