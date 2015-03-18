module Docomoru
  module KnowledgeMethods
    PATH = "/knowledgeQA/v1/ask"

    def create_knowledge(message, params = {}, headers = {})
      get(
        "#{PATH}?#{default_query_string}&q=#{message}",
        params,
        headers,
      )
    end
  end
end
