module SynapsePay
  class Bank < APIResource
    attr_accessor :account_class
    attr_accessor :account_number_string
    attr_accessor :account_type
    attr_accessor :bank_name
    attr_accessor :date
    attr_accessor :id
    attr_accessor :is_active
    attr_accessor :is_buyer_default
    attr_accessor :is_seller_default
    attr_accessor :is_verified
    attr_accessor :name_on_account
    attr_accessor :nickname
    attr_accessor :resource_uri
    attr_accessor :routing_number_string

    def remove(params={}, headers={})
      params = ParamsBuilder.merge({
        :bank_id => id,
      }, params)
      method = APIMethod.new(:post, "/bank/delete", params, headers, self)
      json = @client.execute(method)
      json
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "bank")
    @api_attributes = {
      :account_class => {},
      :account_number_string => {},
      :account_type => {},
      :bank_name => {},
      :date => {},
      :id => {},
      :is_active => {},
      :is_buyer_default => {},
      :is_seller_default => {},
      :is_verified => {},
      :name_on_account => {},
      :nickname => {},
      :resource_uri => {},
      :routing_number_string => {},
    }
  end
end
