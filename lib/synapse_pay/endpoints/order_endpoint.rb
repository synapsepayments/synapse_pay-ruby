module SynapsePay
  class OrderEndpoint < APIEndpoint
    
    def create(params={}, headers={})
      method = APIMethod.new(:post, "/order/add", params, headers, self)
      json = @client.execute(method)
      Order.new(json[:order], method, @client)
    end

    def poll(order_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :order_id => order_id,
      }, params)
      method = APIMethod.new(:post, "/order/poll", params, headers, self)
      json = @client.execute(method)
      Order.new(json[:order], method, @client)
    end

    def recent(params={}, headers={})
      method = APIMethod.new(:post, "/order/recent", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Order, json[:orders], method, @client)
    end

    def update(order_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :order_id => order_id,
      }, params)
      method = APIMethod.new(:post, "/order/update", params, headers, self)
      json = @client.execute(method)
      Order.new(json[:order], method, @client)
    end

    def void(order_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :order_id => order_id,
      }, params)
      method = APIMethod.new(:post, "/order/void", params, headers, self)
      json = @client.execute(method)
      Order.new(json[:order], method, @client)
    end

  end
end
