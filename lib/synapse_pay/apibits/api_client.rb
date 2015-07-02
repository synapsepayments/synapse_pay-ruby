module SynapsePay
  class APIClient
    attr_accessor :headers, :params

    def initialize(headers, params)
      self.refresh_from(headers, params)
    end

    def refresh_from(headers, params)
      @headers = headers
      @params = params
      self
    end

    def execute(api_method)
      api_method.headers = ParamsBuilder.merge(api_method.headers, @headers)
      api_method.params = ParamsBuilder.merge(api_method.params, @params)
      api_method.execute
    end

    def inspect
      "#<#{self.class}:0x#{self.object_id.to_s(16)}> Headers: " +
        JSON.pretty_generate(@headers) + ", Params: " +
        JSON.pretty_generate(@params)
    end
  end
end
