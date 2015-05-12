module SynapsePay
  class APIEndpoint
    attr_accessor :client

    def initialize(client)
      @client = client
    end
  end
end
