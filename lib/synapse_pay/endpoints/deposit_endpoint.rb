module SynapsePay
  class DepositEndpoint < APIEndpoint

    def all(params = {}, headers = {})
      method = APIMethod.new(:post, "/deposit/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Deposit, json[:deposits], method, @client)
    end

    def create(params = {}, headers = {})
      method = APIMethod.new(:post, "/deposit/add", params, headers, self)
      json = @client.execute(method)
      Deposit.new(json[:deposit], method, @client)
    end

    def micro(params = {}, headers = {})
      method = APIMethod.new(:post, "/deposit/micro", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Deposit, json[:deposits], method, @client)
    end
  end
end
