module SynapsePay
  class BankEndpoint < APIEndpoint
    
    def add(params={}, headers={})
      method = APIMethod.new(:post, "/bank/add", params, headers, self)
      json = @client.execute(method)
      Bank.new(json[:bank], method, @client)
    end

    def all(params={}, headers={})
      method = APIMethod.new(:post, "/bank/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Bank, json[:banks], method, @client)
    end

    def link(params={}, headers={})
      method = APIMethod.new(:post, "/bank/login", params, headers, self)
      json = @client.execute(method)
      if(json[:is_mfa] && json[:response][:type] == "questions")
        BankMfaQuestions.new(json[:response], method, @client)
      elsif(json[:is_mfa] && json[:response][:type] == "device")
        BankMfaDevice.new(json[:response], method, @client)
      else
        APIList.new(:Bank, json[:banks], method, @client)
      end
    end

    def refresh(id, params={}, headers={})
      params = ParamsBuilder.merge({
        :id => id,
      }, params)
      method = APIMethod.new(:post, "/bank/refresh", params, headers, self)
      json = @client.execute(method)
      APIList.new(:Bank, json[:banks], method, @client)
    end

    def remove(bank_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :bank_id => bank_id,
      }, params)
      method = APIMethod.new(:post, "/bank/delete", params, headers, self)
      json = @client.execute(method)
      json
    end

  end
end
