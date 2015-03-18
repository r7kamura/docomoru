require "docomoru/dialogue_methods"
require "docomoru/knowledge_methods"
require "docomoru/response"
require "docomoru/version"
require "active_support/core_ext/object/to_query"
require "faraday"
require "faraday_middleware"

module Docomoru
  class Client
    DEFAULT_HOST = "api.apigw.smt.docomo.ne.jp"

    DEFAULT_USER_AGENT = "#{self} #{VERSION}"

    DEFAULT_HEADERS = {
      "User-Agent" => DEFAULT_USER_AGENT,
    }

    include DialogueMethods
    include KnowledgeMethods

    # @param [String] api_key API Key issued from docomo.
    def initialize(api_key: nil)
      @api_key = api_key
    end

    def get(path, params = nil, headers = nil)
      process(:get, path, params, headers)
    end

    def post(path, params = nil, headers = nil)
      process(:post, path, params, headers)
    end

    private

    def connection
      @connection ||= Faraday.new(headers: DEFAULT_HEADERS, url: url_prefix) do |connection|
        connection.request :json
        connection.response :json
        connection.adapter Faraday.default_adapter
      end
    end

    def default_queries
      { APIKEY: @api_key }
    end

    def default_query_string
      default_queries.to_query
    end

    def process(request_method, path, params, headers)
      Response.new(
        connection.send(
          request_method,
          path,
          params,
          headers,
        )
      )
    end

    def url_prefix
      "https://#{DEFAULT_HOST}"
    end
  end
end
