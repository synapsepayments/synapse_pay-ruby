require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class HeadersBuilderTest < ::Test::Unit::TestCase

    setup do
      @headers = {
        :dog => "dog-value"
      }
      @api_key = "test-api-key"
      @built_headers = HeadersBuilder.build(@headers, @api_key)
    end

    should 'set the content_type' do
      assert(@built_headers.has_key?(:content_type))
      assert_equal('application/x-www-form-urlencoded', @built_headers[:content_type])
    end

    should 'set the user_agent' do
      assert(@built_headers.has_key?(:user_agent))
      assert(@built_headers[:user_agent].include?(SynapsePay::VERSION))
      assert(@built_headers[:user_agent].include?(SynapsePay.api_version))
    end

    should 'set the basic auth header' do
      assert(@built_headers.has_key?("Authorization"))
      encoded_api_key = Base64.encode64("#{@api_key}:")
      assert(@built_headers["Authorization"].include?(encoded_api_key))
    end

    should 'set the custom auth header' do
      auth_key = "CLIENT-TOKEN"
      header = HeadersBuilder.build(@headers, @api_key, auth_key)
      assert(header.has_key?(auth_key))
      assert_equal(@api_key, header[auth_key])
    end

  end
end
