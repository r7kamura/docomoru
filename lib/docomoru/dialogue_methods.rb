module Docomoru
  module DialogueMethods
    PATH = "/dialogue/v1/dialogue"

    def create_dialogue(message, params = {}, headers = {})
      post(
        "#{PATH}?#{default_query_string}",
        params.merge(utt: message),
        headers,
      )
    end
  end
end
