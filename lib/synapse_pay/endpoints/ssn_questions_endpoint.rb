module SynapsePay
  class SsnQuestionsEndpoint < APIEndpoint

    def answer(id, questions, params={}, headers={})
      params = ParamsBuilder.merge({
        :id => id,
        :questions => questions,
      }, params)
      method = APIMethod.new(:post, "/user/ssn/answer", params, headers, self)
      json = @client.execute(method)
      json
    end

  end
end
