require "docomoru/client"
require "docomoru/commands/base"
require "docomoru/response_renderer"

module Docomoru
  module Commands
    class Request < Base
      def call
        response = client.send(
          @arguments.method_name,
          *@arguments.arguments,
          @arguments.params,
          @arguments.headers,
        )
        print ResponseRenderer.new(
          response,
          show_body: @arguments.show_body,
          show_header: @arguments.show_header,
        )
      end

      private

      def client
        Client.new(api_key: @arguments.api_key)
      end
    end
  end
end
