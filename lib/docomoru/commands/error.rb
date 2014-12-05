require "docomoru/commands/base"

module Docomoru
  module Commands
    class Error < Base
      def call
        abort(@arguments.error_message)
      end
    end
  end
end
