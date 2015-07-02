module SynapsePay
  class BankStatusEndpoint < APIEndpoint

    def all(params = {}, headers = {})
      method = APIMethod.new(:post, "/bankstatus/show", params, headers, self)
      json = @client.execute(method)
      APIList.new(:BankStatus, json[:banks], method, @client)
    end
  end
end
