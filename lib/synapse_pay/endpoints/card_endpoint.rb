module SynapsePay
  class CardEndpoint < APIEndpoint

    def all(params = {}, headers = {})
      method = APIMethod.new(:post, "/card/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Card, json[:cards], method, @client)
    end

    def create(params = {}, headers = {})
      method = APIMethod.new(:post, "/card/add", params, headers, self)
      json = @client.execute(method)
      Card.new(json[:card], method, @client)
    end

    def update(id, params = {}, headers = {})
      params = ParamsBuilder.merge({ id: id }, params)
      method = APIMethod.new(:post, "/card/edit", params, headers, self)
      json = @client.execute(method)
      Card.new(json[:card], method, @client)
    end
  end
end
