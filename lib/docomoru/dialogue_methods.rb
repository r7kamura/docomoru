module Docomoru
  module DialogueMethods
    PATH = "/dialogue/v1/dialogue"

    def create_dialogue(utt, params = {}, headers = {})
      post(
        "#{PATH}?#{default_query_string}",
        params.merge(utt: utt),
        headers,
      )
    end
  end
end
