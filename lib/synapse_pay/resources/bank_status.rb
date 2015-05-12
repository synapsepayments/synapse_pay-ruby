module SynapsePay
  class BankStatus < APIResource
    attr_accessor :date
    attr_accessor :id
    attr_accessor :logo
    attr_accessor :resource_uri
    attr_accessor :status
    attr_accessor :bank_name

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "bank_status")
    @api_attributes = {
      :date => {},
      :id => {},
      :logo => {},
      :resource_uri => {},
      :status => {},
      :bank_name => {},
    }
  end
end
