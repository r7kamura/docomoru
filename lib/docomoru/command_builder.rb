require "docomoru/arguments"
require "docomoru/commands/error"
require "docomoru/commands/request"

module Docomoru
  class CommandBuilder
    def initialize(argv)
      @argv = argv
    end

    def call
      if arguments.valid?
        Commands::Request.new(arguments)
      else
        Commands::Error.new(arguments)
      end
    end

    private

    def arguments
      @arguments ||= Arguments.new(@argv)
    end
  end
end
