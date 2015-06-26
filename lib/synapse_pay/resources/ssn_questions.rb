module SynapsePay
  class SsnQuestions < APIResource
    attr_accessor :questions
    attr_accessor :id

    def answer(answers, params={}, headers={})
      params = ParamsBuilder.merge({
        :id => id,
        :questions => answers,
      }, params)
      method = APIMethod.new(:post, "/user/ssn/answer", params, headers, self)
      json = @client.execute(method)
      json
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "ssn_questions")
    @api_attributes = {
      :questions => {},
      :id => {},
    }
  end
end
