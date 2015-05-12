module SynapsePay
  class Order < APIResource
    attr_accessor :status_url
    attr_accessor :tip
    attr_accessor :id
    attr_accessor :seller
    attr_accessor :fee
    attr_accessor :resource_uri
    attr_accessor :ticket_number
    attr_accessor :total
    attr_accessor :amount
    attr_accessor :date
    attr_accessor :supp_id
    attr_accessor :is_buyer
    attr_accessor :note
    attr_accessor :account_type
    attr_accessor :discount
    attr_accessor :status
    attr_accessor :date_settled
    attr_accessor :facilitator_fee

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
      :status_url => {},
      :tip => {},
      :id => {},
      :seller => {},
      :fee => {},
      :resource_uri => {},
      :ticket_number => {},
      :total => {},
      :amount => {},
      :date => {},
      :supp_id => {},
      :is_buyer => {},
      :note => {},
      :account_type => {},
      :discount => {},
      :status => {},
      :date_settled => {},
      :facilitator_fee => {},
    }
  end
end
