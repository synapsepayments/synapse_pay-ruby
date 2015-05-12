module SynapsePay
  class Deposit < APIResource
    attr_accessor :bank
    attr_accessor :date_created
    attr_accessor :id
    attr_accessor :resource_uri
    attr_accessor :status
    attr_accessor :status_url
    attr_accessor :user_id
    attr_accessor :amount

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "deposit")
    @api_attributes = {
      :bank => {},
      :date_created => {},
      :id => {},
      :resource_uri => {},
      :status => {},
      :status_url => {},
      :user_id => {},
      :amount => {},
    }
  end
end
