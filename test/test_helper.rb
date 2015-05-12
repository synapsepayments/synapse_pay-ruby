require 'synapse_pay'
require 'test/unit'
require 'mocha/setup'
require 'stringio'
require 'shoulda'
require File.expand_path('../test_data', __FILE__)
# require File.expand_path('../mock_resource', __FILE__)

# monkeypatch request methods
module SynapsePay
  class << self
    attr_accessor :mock_rest_client
  end

  module Requester
    def self.request(method, url, params, headers)
      case method
      when :get then SynapsePay::mock_rest_client.get(url, headers, params)
      when :put then SynapsePay::mock_rest_client.put(url, headers, params)
      when :post then SynapsePay::mock_rest_client.post(url, headers, params)
      when :delete then SynapsePay::mock_rest_client.delete(url, headers, params)
      else
        raise "Invalid method"
      end
    end
  end
end

class ::Test::Unit::TestCase
  include SynapsePay::TestData
  include Mocha

  setup do
    @mock = mock
    SynapsePay.mock_rest_client = @mock
  end

  teardown do
    SynapsePay.mock_rest_client = nil
  end
end
