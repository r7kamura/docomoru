module Docomoru
  module KnowledgeMethods
    PATH = "/knowledgeQA/v1/ask"

    def create_knowledge(q, params = {}, headers = {})
      get(
        "#{PATH}?#{default_query_string}&q=#{q}",
        params,
        headers,
      )
    end
  end
end
