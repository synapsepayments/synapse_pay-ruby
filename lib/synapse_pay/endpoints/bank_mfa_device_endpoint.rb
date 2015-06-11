module SynapsePay
  class BankMfaDeviceEndpoint < APIEndpoint
    
    def answer(access_token, bank, mfa, params={}, headers={})
      params = ParamsBuilder.merge({
        :access_token => access_token,
        :bank => bank,
        :mfa => mfa,
      }, params)
      method = APIMethod.new(:post, "/bank/mfa", params, headers, self)
      json = @client.execute(method)
      if(json[:is_mfa] && json[:response][:type] == "questions")
        BankMfaQuestions.new(json[:response], method, @client)
      elsif(json[:is_mfa] && json[:response][:type] == "device")
        BankMfaDevice.new(json[:response], method, @client)
      else
        APIList.new(:Bank, json[:banks], method, @client)
      end
    end

  end
end
