module SynapsePay
  class Order < APIResource
    attr_accessor :account_type
    attr_accessor :amount
    attr_accessor :date
    attr_accessor :date_settled
    attr_accessor :discount
    attr_accessor :facilitator_fee
    attr_accessor :fee
    attr_accessor :id
    attr_accessor :is_buyer
    attr_accessor :note
    attr_accessor :resource_uri
    attr_accessor :seller
    attr_accessor :status
    attr_accessor :status_url
    attr_accessor :supp_id
    attr_accessor :ticket_number
    attr_accessor :tip
    attr_accessor :total

    def update(params={}, headers={})
      params = ParamsBuilder.merge({
        :order_id => id,
      }, params)
      method = APIMethod.new(:post, "/order/update", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:order], method)
    end

    def void(params={}, headers={})
      params = ParamsBuilder.merge({
        :order_id => id,
      }, params)
      method = APIMethod.new(:post, "/order/void", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:order], method)
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "order")
    @api_attributes = {
      :account_type => {},
      :amount => {},
      :date => {},
      :date_settled => {},
      :discount => {},
      :facilitator_fee => {},
      :fee => {},
      :id => {},
      :is_buyer => {},
      :note => {},
      :resource_uri => {},
      :seller => {},
      :status => {},
      :status_url => {},
      :supp_id => {},
      :ticket_number => {},
      :tip => {},
      :total => {},
    }
  end
end
