module SynapsePay
  module TestData

    def test_response(body, code=200)
      # When an exception is raised, restclient clobbers method_missing.  Hence we
      # can't just use the stubs interface.
      body = JSON.generate(body) if !(body.kind_of? String)
      m = mock
      m.instance_variable_set('@synapse_pay_values', { :body => body, :code => code })
      def m.body; @synapse_pay_values[:body]; end
      def m.code; @synapse_pay_values[:code]; end
      m
    end

    def test_mock_resource
      {
        :object => 'mock_resource',
        :name => 'test mr name',
        :nested => {
          :id => 'test_nested_id',
          :object => 'nested_resource',
          :price => 500
        },
        :nested_alt_id => 'nested_alt_id',
        :nested_with => {
          :id => 'nested_with_id',
          :price => 500
        },
        :thash => { :some_key => "some value" },
        :tarray => ["abc", "xyz"],
        :id => 'test_mock_resource_id'
      }
    end

    def test_mock_resource_list
      {
        :object => 'list',
        :data => [test_mock_resource, test_mock_resource, test_mock_resource],
      }
    end


    # Errors
    def test_api_error
      {
        :error => {
          :type => "api_error"
        }
      }
    end

    def test_invalid_api_key_error
      {
        :error => {
          :type => "invalid_request_error",
          :message => "Invalid API Key provided: invalid"
        }
      }
    end

    def test_missing_id_error
      {
        :error => {
          :param => "id",
          :type => "invalid_request_error",
          :message => "Missing id"
        }
      }
    end

  end
end
