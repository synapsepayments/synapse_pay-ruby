module SynapsePay
  class Withdrawal < APIResource
    attr_accessor :fee
    attr_accessor :resource_uri
    attr_accessor :status
    attr_accessor :status_url
    attr_accessor :user_id
    attr_accessor :date_created
    attr_accessor :bank
    attr_accessor :id
    attr_accessor :instant_credit
    attr_accessor :amount

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "withdrawal")
    @api_attributes = {
      :fee => {},
      :resource_uri => {},
      :status => {},
      :status_url => {},
      :user_id => {},
      :date_created => {},
      :bank => {},
      :id => {},
      :instant_credit => {},
      :amount => {},
    }
  end
end
