module SynapsePay
  class MassPay < APIResource
    attr_accessor :account_number_string
    attr_accessor :amount
    attr_accessor :date
    attr_accessor :fee
    attr_accessor :id
    attr_accessor :name_on_account
    attr_accessor :resource_uri
    attr_accessor :routing_number_string
    attr_accessor :status
    attr_accessor :trans_type

    def cancel(params={}, headers={})
      params = ParamsBuilder.merge({
        :id => id,
      }, params)
      method = APIMethod.new(:post, "/masspay/cancel", params, headers, self)
      json = @client.execute(method)
      APIList.new(:MassPay, json[:mass_pays], method, @client)
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "mass_pay")
    @api_attributes = {
      :account_number_string => {},
      :amount => {},
      :date => {},
      :fee => {},
      :id => {},
      :name_on_account => {},
      :resource_uri => {},
      :routing_number_string => {},
      :status => {},
      :trans_type => {},
    }
  end
end
