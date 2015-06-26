module SynapsePay
  class SsnQuestions < APIResource
    attr_accessor :question_set

    def answer(id, questions, params={}, headers={})
      params = ParamsBuilder.merge({
        :id => id,
        :questions => questions,
      }, params)
      method = APIMethod.new(:post, "/user/ssn/answer", params, headers, self)
      json = @client.execute(method)
      json
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "ssn_questions")
    @api_attributes = {
      :question_set => {},
    }
  end
end
