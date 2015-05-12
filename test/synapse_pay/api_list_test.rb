require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class APIListTest < ::Test::Unit::TestCase

    context '#new / #initialize' do
      setup do
        @fake_resource = {:data => "fake-data"}
        @list = APIList.new(APIResource, [@fake_resource])
      end

      should 'set the klass' do
        assert_equal(APIResource, @list.klass)
      end

      should 'convert the data to klass instances' do
        assert(@list.first.is_a?(APIResource))
        assert_equal(@fake_resource, @list.first.json)
      end
    end

  end
end
