module SynapsePay
  class WithdrawalEndpoint < APIEndpoint
    
    def all(params={}, headers={})
      method = APIMethod.new(:post, "/withdraw/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Withdrawal, json[:withdraws], method, @client)
    end

    def create(params={}, headers={})
      method = APIMethod.new(:post, "/withdraw/add", params, headers, self)
      json = @client.execute(method)
      Withdrawal.new(json[:withdrawal], method, @client)
    end

  end
end
