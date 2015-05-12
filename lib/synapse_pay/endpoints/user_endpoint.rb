module SynapsePay
  class UserEndpoint < APIEndpoint
    
    def retrieve(params={}, headers={})
      method = APIMethod.new(:post, "/user/show", params, headers, self)
      json = @client.execute(method)
      User.new(json[:user], method, @client)
    end

    def search(query, params={}, headers={})
      params = ParamsBuilder.merge({
        :query => query,
      }, params)
      method = APIMethod.new(:post, "/user/customers", params, headers, self)
      json = @client.execute(method)
      APIList.new(:User, json[:customers], method, @client)
    end

    def update(params={}, headers={})
      method = APIMethod.new(:post, "/user/edit", params, headers, self)
      json = @client.execute(method)
      User.new(json[:user], method, @client)
    end

  end
end
