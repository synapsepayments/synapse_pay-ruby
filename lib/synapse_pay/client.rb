module SynapsePay
  class Client < APIClient
    attr_reader :oauth_consumer_key,
                :refresh_token,
                :expires_at,
                :expires_in,
                :username,
                :user_id,
                :json


    def initialize(oauth_consumer_key=nil, refresh_token=nil)
      self.refresh_from({
        :oauth_consumer_key => oauth_consumer_key,
        :refresh_token => refresh_token
      })
    end

    def refresh_from(json)
      @json = Util.symbolize_keys(json)

      @oauth_consumer_key = @json[:oauth_consumer_key]
      @refresh_token = @json[:refresh_token]
      @expires_at = @json[:expires_at]
      @expires_in = @json[:expires_in]
      @username = @json[:username]
      @user_id = @json[:user_id]

      super({}, { :oauth_consumer_key => oauth_consumer_key })
    end

    def self.login(username, password)
      method = APIMethod.new(
        :post,
        "/user/login",
        { :username => username, :password => password }, {}, self)
      self.new.refresh_from(method.execute)
    end


    def self.refresh_access(refresh_token)
      c = Client.new(nil, refresh_token)
      c.refresh_access
    end

    def refresh_access(refresh_token=nil)
      method = APIMethod.new(
        :post,
        "/user/refresh",
        { :refresh_token => refresh_token || @refresh_token }, {}, self)
      self.refresh_from(method.execute)
    end

    def user
      @user ||= UserEndpoint.new(self)
    end

    def banks
      @banks ||= BankEndpoint.new(self)
    end

    def bank_mfa_devices
      @bank_mfa_devices ||= BankMfaDeviceEndpoint.new(self)
    end

    def bank_mfa_questions
      @bank_mfa_questions ||= BankMfaQuestionsEndpoint.new(self)
    end

    def bank_statuses
      @bank_statuses ||= BankStatusEndpoint.new(self)
    end

    def cards
      @cards ||= CardEndpoint.new(self)
    end

    def deposits
      @deposits ||= DepositEndpoint.new(self)
    end

    def mass_pays
      @mass_pays ||= MassPayEndpoint.new(self)
    end

    def orders
      @orders ||= OrderEndpoint.new(self)
    end

    def wires
      @wires ||= WireEndpoint.new(self)
    end

    def withdrawals
      @withdrawals ||= WithdrawalEndpoint.new(self)
    end

  end
end
