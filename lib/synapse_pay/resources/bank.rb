module SynapsePay
  class Bank < APIResource
    attr_accessor :account_class
    attr_accessor :account_number_string
    attr_accessor :account_type
    attr_accessor :address
    attr_accessor :balance
    attr_accessor :bank_name
    attr_accessor :date
    attr_accessor :email
    attr_accessor :id
    attr_accessor :is_buyer_default
    attr_accessor :is_seller_default
    attr_accessor :mfa_verifed
    attr_accessor :name_on_account
    attr_accessor :nickname
    attr_accessor :phone_number
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
      :address => {},
      :balance => {},
      :bank_name => {},
      :date => {},
      :email => {},
      :id => {},
      :is_buyer_default => {},
      :is_seller_default => {},
      :mfa_verifed => {},
      :name_on_account => {},
      :nickname => {},
      :phone_number => {},
      :resource_uri => {},
      :routing_number_string => {},
    }
  end
end
