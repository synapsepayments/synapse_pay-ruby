module SynapsePay
  class Card < APIResource
    attr_accessor :account_class, :account_number_string, :account_type, 
                  :id, :name_on_account, :resource_uri, :routing_number_string

    def update(params = {}, headers = {})
      params = ParamsBuilder.merge({ id: id, }, params)
      method = APIMethod.new(:post, "/card/edit", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:card], method, @client)
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "card")
    @api_attributes = {
      account_class: {},
      account_number_string: {},
      account_type: {},
      id: {},
      name_on_account: {},
      resource_uri: {},
      routing_number_string: {},
    }
  end
end
