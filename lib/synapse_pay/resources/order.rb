module SynapsePay
  class Order < APIResource
    attr_accessor :account_type, :amount, :date, :date_settled, :discount, 
                  :facilitator_fee, :fee, :id, :is_buyer, :note, :resource_uri, 
                  :seller, :status, :status_url, :supp_id, :ticket_number, 
                  :tip, :total

    def update(params = {}, headers = {})
      params = ParamsBuilder.merge({ order_id: id }, params)
      method = APIMethod.new(:post, "/order/update", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:order], method, @client)
    end

    def void(params = {}, headers = {})
      params = ParamsBuilder.merge({ order_id: id }, params)
      method = APIMethod.new(:post, "/order/void", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:order], method, @client)
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "order")
    @api_attributes = {
      account_type: {},
      amount: {},
      date: {},
      date_settled: {},
      discount: {},
      facilitator_fee: {},
      fee: {},
      id: {},
      is_buyer: {},
      note: {},
      resource_uri: {},
      seller: {},
      status: {},
      status_url: {},
      supp_id: {},
      ticket_number: {},
      tip: {},
      total: {},
    }
  end
end
