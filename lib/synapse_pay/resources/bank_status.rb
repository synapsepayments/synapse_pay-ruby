module SynapsePay
  class BankStatus < APIResource
    attr_accessor :bank_name, :date, :id, :logo, :resource_uri, :status

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "bank_status")
    @api_attributes = {
      bank_name: {},
      date: {},
      id: {},
      logo: {},
      resource_uri: {},
      status: {},
    }
  end
end
