module SynapsePay
  class BankMfaDevice < APIResource
    attr_accessor :type
    attr_accessor :access_token
    attr_accessor :cookies
    attr_accessor :form_extra
    attr_accessor :mfa

    def answer(bank, mfa, params={}, headers={})
      params = ParamsBuilder.merge({
        :bank => bank,
        :mfa => mfa,
      }, params)
      params = ParamsBuilder.merge({
        :access_token => access_token,
      }, params)
      method = APIMethod.new(:post, "/bank/mfa", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Bank, json[:banks], method, @client)
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "bank_mfa_device")
    @api_attributes = {
      :type => {},
      :access_token => {},
      :cookies => {},
      :form_extra => {},
      :mfa => {},
    }
  end
end
