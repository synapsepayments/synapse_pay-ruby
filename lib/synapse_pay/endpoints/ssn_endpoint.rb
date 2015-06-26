module SynapsePay
  class SsnEndpoint < APIEndpoint

    def add(params={}, headers={})
      method = APIMethod.new(:post, "/user/ssn/add", params, headers, self)
      json = @client.execute(method)
      if (json[:question_set].present?)
        SsnQuestions.new(json[:response], method, @client)
      else
        json
      end
    end

  end
end
