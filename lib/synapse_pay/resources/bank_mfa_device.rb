module SynapsePay
  class BankMfaDevice < APIResource
    attr_accessor :access_token, :cookies, :form_extra, :mfa, :type

    def answer(bank, mfa, params = {}, headers = {})
      params = ParamsBuilder.merge({ bank: bank, mfa: mfa }, params)
      params = ParamsBuilder.merge({ access_token: access_token }, params)
      method = APIMethod.new(:post, "/bank/mfa", params, headers, self)
      json = @client.execute(method)
      if(json[:is_mfa] && json[:response][:type] == "questions")
        BankMfaQuestions.new(json[:response], method, @client)
      elsif(json[:is_mfa] && json[:response][:type] == "device")
        BankMfaDevice.new(json[:response], method, @client)
      else
        APIList.new(:Bank, json[:banks], method, @client)
      end
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "bank_mfa_device")
    @api_attributes = {
      access_token: {},
      cookies: {},
      form_extra: {},
      mfa: {},
      type: {},
    }
  end
end
