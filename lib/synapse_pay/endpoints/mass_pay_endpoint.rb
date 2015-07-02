module SynapsePay
  class MassPayEndpoint < APIEndpoint

    def all(params = {}, headers = {})
      method = APIMethod.new(:post, "/masspay/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:MassPay, json[:mass_pays], method, @client)
    end

    def cancel(id, params = {}, headers = {})
      params = ParamsBuilder.merge({ id: id }, params)
      method = APIMethod.new(:post, "/masspay/cancel", params, headers, self)
      json = @client.execute(method)
      APIList.new(:MassPay, json[:mass_pays], method, @client)
    end

    def create(params = {}, headers = {})
      method = APIMethod.new(:post, "/masspay/add", params, headers, self)
      json = @client.execute(method)
      APIList.new(:MassPay, json[:mass_pays], method, @client)
    end
  end
end
