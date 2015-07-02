module SynapsePay
  class Deposit < APIResource
    attr_accessor :amount, :bank, :date_created, :id, :resource_uri, 
                  :status, :status_url, :user_id

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "deposit")
    @api_attributes = {
      amount: {},
      bank: {},
      date_created: {},
      id: {},
      resource_uri: {},
      status: {},
      status_url: {},
      user_id: {},
    }
  end
end
