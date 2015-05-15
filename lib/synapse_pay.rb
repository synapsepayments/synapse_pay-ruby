# SynapsePay Ruby bindings
# API Docs are located at http://synapsepay.readme.io/v1.0/docs
require 'cgi'
require 'set'
require 'openssl'
require 'rest_client'
require 'json'
require 'base64'

# Version
require 'synapse_pay/version'

# Errors
require 'synapse_pay/errors/synapse_pay_error'
require 'synapse_pay/errors/api_error'
require 'synapse_pay/errors/api_connection_error'
require 'synapse_pay/errors/authentication_error'

# Wrapper around RestClient
require 'synapse_pay/apibits/requester'

# Builders for creating API methods.
require 'synapse_pay/apibits/path_builder'
require 'synapse_pay/apibits/headers_builder'
require 'synapse_pay/apibits/params_builder'
require 'synapse_pay/apibits/api_method'

# Generic resources
require 'synapse_pay/apibits/api_endpoint'
require 'synapse_pay/apibits/api_client'
require 'synapse_pay/apibits/api_object'
require 'synapse_pay/apibits/api_resource'
require 'synapse_pay/apibits/api_list'
require 'synapse_pay/apibits/util'

# API specific resources
require 'synapse_pay/resources/bank'
require 'synapse_pay/resources/bank_mfa_device'
require 'synapse_pay/resources/bank_mfa_questions'
require 'synapse_pay/resources/bank_status'
require 'synapse_pay/resources/card'
require 'synapse_pay/resources/deposit'
require 'synapse_pay/resources/mass_pay'
require 'synapse_pay/resources/order'
require 'synapse_pay/resources/user'
require 'synapse_pay/resources/wire'
require 'synapse_pay/resources/withdrawal'

# API specific endpoints
require 'synapse_pay/endpoints/bank_endpoint'
require 'synapse_pay/endpoints/bank_mfa_device_endpoint'
require 'synapse_pay/endpoints/bank_mfa_questions_endpoint'
require 'synapse_pay/endpoints/bank_status_endpoint'
require 'synapse_pay/endpoints/card_endpoint'
require 'synapse_pay/endpoints/deposit_endpoint'
require 'synapse_pay/endpoints/mass_pay_endpoint'
require 'synapse_pay/endpoints/order_endpoint'
require 'synapse_pay/endpoints/user_endpoint'
require 'synapse_pay/endpoints/wire_endpoint'
require 'synapse_pay/endpoints/withdrawal_endpoint'

# OAuth Client
require 'synapse_pay/client'

module SynapsePay
  @api_base = "https://synapsepay.com/api/v2"
  @api_staging = "https://sandbox.synapsepay.com/api/v2"
  @api_version = "v2"
  @support_email = "hello@synapsepay.com"
  @docs_url = "http://synapsepay.readme.io/v1.0/docs"
  @api_sandbox = "https://sandbox.synapsepay.com/api/v2"

  class << self
    attr_accessor :api_base, :api_version
    attr_reader :api_staging, :support_email, :docs_url
    attr_accessor :client_id, :client_secret, :api_sandbox
  end
end
