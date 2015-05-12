module SynapsePay
  class Card < APIResource
    attr_accessor :routing_number_string
    attr_accessor :account_class
    attr_accessor :account_number_string
    attr_accessor :account_type
    attr_accessor :id
    attr_accessor :name_on_account
    attr_accessor :resource_uri

    def update(params={}, headers={})
      params = ParamsBuilder.merge({
        :id => id,
      }, params)
      method = APIMethod.new(:post, "/card/edit", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:card], method)
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "card")
    @api_attributes = {
      :routing_number_string => {},
      :account_class => {},
      :account_number_string => {},
      :account_type => {},
      :id => {},
      :name_on_account => {},
      :resource_uri => {},
    }
  end
end
