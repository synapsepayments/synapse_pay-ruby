module SynapsePay
  class BankStatus < APIResource
    attr_accessor :bank_name
    attr_accessor :date
    attr_accessor :id
    attr_accessor :logo
    attr_accessor :resource_uri
    attr_accessor :status

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "bank_status")
    @api_attributes = {
      :bank_name => {},
      :date => {},
      :id => {},
      :logo => {},
      :resource_uri => {},
      :status => {},
    }
  end
end
