module SynapsePay
  module ParamsBuilder

    def self.clean(params)
      Util.symbolize_keys(params || {})
    end

    # Clean the params, and the hash to_merge, and then merge them.
    # This ensures that we dont get something like { "id" => 123, :id => 321 }.
    def self.merge(*args)
      ret = {}
      args.each do |arg|
        ret = ret.merge(clean(arg))
      end
      ret
    end

    def self.build(params, api_key = nil, auth_key = nil)
      default_params.merge(clean(params))
    end

    def self.default_params
      params = { client_id: SynapsePay.client_id, client_secret: SynapsePay.client_secret }
    end
  end
end
