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
      APIList.new(:Bank, json[:banks], method, @client)
    end

  end
end
