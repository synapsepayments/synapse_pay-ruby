module SynapsePay
  class Wire < APIResource
    attr_accessor :resource_uri
    attr_accessor :status
    attr_accessor :amount
    attr_accessor :date
    attr_accessor :memo
    attr_accessor :reference_id
    attr_accessor :routing_number_string
    attr_accessor :status_url
    attr_accessor :account_number_string
    attr_accessor :fee
    attr_accessor :id

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "wire")
    @api_attributes = {
      :resource_uri => {},
      :status => {},
      :amount => {},
      :date => {},
      :memo => {},
      :reference_id => {},
      :routing_number_string => {},
      :status_url => {},
      :account_number_string => {},
      :fee => {},
      :id => {},
    }
  end
end
