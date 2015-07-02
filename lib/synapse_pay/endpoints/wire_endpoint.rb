module SynapsePay
  class WireEndpoint < APIEndpoint

    def all_incoming(params = {}, headers = {})
      method = APIMethod.new(:post, "/wirein/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Wire, json[:wires], method, @client)
    end

    def all_outgoing(params = {}, headers = {})
      method = APIMethod.new(:post, "/wireout/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Wire, json[:wires], method, @client)
    end

    def create_incoming(params = {}, headers = {})
      method = APIMethod.new(:post, "/wirein/add", params, headers, self)
      json = @client.execute(method)
      Wire.new(json[:wire], method, @client)
    end

    def create_outgoing(params = {}, headers = {})
      method = APIMethod.new(:post, "/wireout/add", params, headers, self)
      json = @client.execute(method)
      Wire.new(json[:wire], method, @client)
    end
  end
end
