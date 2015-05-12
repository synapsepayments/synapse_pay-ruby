require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class RequesterTest < ::Test::Unit::TestCase
    setup do
    end

    context '#prepare_params' do
      setup do
        @url = "test_url"
        @params = { :a => 1, :b => [2, 3] }
      end

      should 'convert :get params to a query string' do
        url, params = Requester.prepare_params(@url, @params, :get)
        assert(url != @url)
        assert(params.nil?)
      end

      should 'convert :delete params to a query string' do
        url, params = Requester.prepare_params(@url, @params, :delete)
        assert(url != @url)
        assert(params.nil?)
      end

      should 'convert :head params to a query string' do
        url, params = Requester.prepare_params(@url, @params, :head)
        assert(url != @url)
        assert(params.nil?)
      end

      context 'method = :post' do
        setup do
          @method = :post
        end

        should 'not convert params to a query string if a file is in them' do
          expected = { file: File.new(__FILE__) }
          url, params = Requester.prepare_params(@url, expected, @method)
          assert_equal(expected, params)
        end

        should 'convert params to a query string if a file is not present' do
          url, params = Requester.prepare_params(@url, @params, @method)
          assert(params.is_a?(String))
        end
      end
    end

    context '#query_string' do
      should 'join #query_array results with an "&"' do
        start = { :a => 1, :b => [2, 3] }
        expected = ["a=1", "b[]=2", "b[]=3"]

        actual = Requester.query_string(start).split('&')
        actual.each do |str|
          assert(expected.include?(str))
        end
      end
    end

    context '#query_array' do
      should 'convert { :a => "value" } to []' do
        start = { :a => "value" }
        finish = ["a=value"]

        assert_equal(finish, Requester.query_array(start))
      end

      should 'convert { :a => { :b => { :c => "cvalue" } } } to ["a[b][c]=cvalue"]' do
        start = { :a => { :b => { :c => "cvalue" } } }
        finish = ["a[b][c]=cvalue"]

        assert_equal(finish, Requester.query_array(start))
      end

      should 'convert { :a => [1, 2] } to ["a[]=1", "a[]=2"]' do
        start = { :a => [1, 2] }
        finish = ["a[]=1", "a[]=2"]

        assert_equal(finish, Requester.query_array(start))
      end
    end

  end
end
