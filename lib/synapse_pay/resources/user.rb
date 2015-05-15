module SynapsePay
  class User < APIResource
    attr_accessor :accept_bank_payments
    attr_accessor :accept_gratuity
    attr_accessor :avatar
    attr_accessor :balance
    attr_accessor :email
    attr_accessor :fullname
    attr_accessor :has_avatar
    attr_accessor :is_trusted
    attr_accessor :phone_number
    attr_accessor :promo_text
    attr_accessor :referral_code
    attr_accessor :resource_uri
    attr_accessor :seller_details
    attr_accessor :user_id
    attr_accessor :username
    attr_accessor :visit_count
    attr_accessor :visit_message

    def self.create(params={}, headers={})
      method = APIMethod.new(:post, "/user/create", params, headers, self)
      json = method.execute
      Client.new().refresh_from(json)
    end

    def self.login(username, password, params={}, headers={})
      params = ParamsBuilder.merge({
        :username => username,
        :password => password,
      }, params)
      method = APIMethod.new(:post, "/user/login", params, headers, self)
      json = method.execute
      Client.new().refresh_from(json)
    end

    def self.refresh_access(refresh_token, params={}, headers={})
      params = ParamsBuilder.merge({
        :refresh_token => refresh_token,
      }, params)
      method = APIMethod.new(:post, "/user/refresh", params, headers, self)
      json = method.execute
      Client.new().refresh_from(json)
    end

    def refresh(params={}, headers={})
      method = APIMethod.new(:post, "/user/show", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:user], method)
    end

    def update(params={}, headers={})
      method = APIMethod.new(:post, "/user/edit", params, headers, self)
      json = @client.execute(method)
      self.refresh_from(json[:user], method)
    end

    # Everything below here is used behind the scenes.
    APIResource.register_api_subclass(self, "user")
    @api_attributes = {
      :accept_bank_payments => {},
      :accept_gratuity => {},
      :avatar => {},
      :balance => {},
      :email => {},
      :fullname => {},
      :has_avatar => {},
      :is_trusted => {},
      :phone_number => {},
      :promo_text => {},
      :referral_code => {},
      :resource_uri => {},
      :seller_details => {},
      :user_id => {},
      :username => {},
      :visit_count => {},
      :visit_message => {},
    }
  end
end
