module SynapsePay
  class SsnEndpoint < APIEndpoint

    def add(params={}, headers={})
      method = APIMethod.new(:post, "/user/ssn/add", params, headers, self)
      json = @client.execute(method)
      SsnQuestions.new(json[:question_set], method, @client)
    end

    def answer(id, answers, params={}, headers={})
      params = ParamsBuilder.merge({
        :id => id,
        :questions => answers,
      }, params)
      method = APIMethod.new(:post, "/user/ssn/answer", params, headers, self)
      json = @client.execute(method)
      json
    end

  end
end
