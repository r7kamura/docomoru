require "active_support/core_ext/string/strip"
require "json"

module Docomoru
  class ResponseRenderer
    def initialize(response, show_header: nil, show_body: nil)
      @response = response
      @show_body = show_body
      @show_header = show_header
    end

    def to_s
      template % {
        status: status,
        headers: headers,
        body: body,
      }
    end

    private

    def body
      JSON.pretty_generate(@response.body) + "\n"
    end

    def headers
      @response.headers.sort_by do |key, value|
        key
      end.map do |key, value|
        "%{key}: %{value}" % {
          key: key.split("-").map(&:camelize).join("-"),
          value: value,
        }
      end.join("\n")
    end

    def status
      "#{@response.status} #{@response.status_message}"
    end

    def template
      str = ""
      str << <<-EOS.strip_heredoc if @show_header
        HTTP/1.1 %{status}
        %{headers}
      EOS
      if @show_body
        str << "\n" if @show_header
        str << "%{body}"
      end
      str
    end
  end
end
