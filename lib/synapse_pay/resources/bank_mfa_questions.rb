module SynapsePay
  class BankMfaQuestions < APIResource
    attr_accessor :access_token
    attr_accessor :mfa
    attr_accessor :type

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
    APIResource.register_api_subclass(self, "bank_mfa_questions")
    @api_attributes = {
      :access_token => {},
      :mfa => {},
      :type => {},
    }
  end
end
