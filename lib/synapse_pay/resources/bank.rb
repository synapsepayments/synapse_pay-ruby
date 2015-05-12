module SynapsePay
  class Bank < APIResource
    attr_accessor :is_active
    attr_accessor :nickname
    attr_accessor :resource_uri
    attr_accessor :date
    attr_accessor :id
    attr_accessor :account_type
    attr_accessor :is_buyer_default
    attr_accessor :is_verified
    attr_accessor :name_on_account
    attr_accessor :routing_number_string
    attr_accessor :account_class
    attr_accessor :is_seller_default
    attr_accessor :account_number_string
    attr_accessor :bank_name

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
      :is_active => {},
      :nickname => {},
      :resource_uri => {},
      :date => {},
      :id => {},
      :account_type => {},
      :is_buyer_default => {},
      :is_verified => {},
      :name_on_account => {},
      :routing_number_string => {},
      :account_class => {},
      :is_seller_default => {},
      :account_number_string => {},
      :bank_name => {},
    }
  end
end
