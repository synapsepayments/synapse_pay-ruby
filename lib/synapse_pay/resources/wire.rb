module SynapsePay
  class Wire < APIResource
    attr_accessor :account_number_string, :amount, :date, :fee, :id, 
                  :memo, :reference_id, :resource_uri, :routing_number_string, 
                  :status, :status_url

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "wire")
    @api_attributes = {
      account_number_string: {},
      amount: {},
      date: {},
      fee: {},
      id: {},
      memo: {},
      reference_id: {},
      resource_uri: {},
      routing_number_string: {},
      status: {},
      status_url: {},
    }
  end
end
