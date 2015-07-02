module SynapsePay
  class Withdrawal < APIResource
    attr_accessor :amount, :bank, :date_created, :fee, :id,
                  :instant_credit, :resource_uri, :status, :status_url,
                  :user_id

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "withdrawal")
    @api_attributes = {
      :amount => {},
      :bank => {},
      :date_created => {},
      :fee => {},
      :id => {},
      :instant_credit => {},
      :resource_uri => {},
      :status => {},
      :status_url => {},
      :user_id => {},
    }
  end
end
