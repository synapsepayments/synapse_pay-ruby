require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class UtilTest < ::Test::Unit::TestCase
    context '#symbolize_keys' do
      should "convert keys to symbols" do
        start = {
          'foo' => 'bar',
          'array' => [{ 'foo' => 'bar' }],
          'nested' => {
            1 => 2,
            :symbol => 9,
            'string' => nil
          }
        }
        finish = {
          :foo => 'bar',
          :array => [{ :foo => 'bar' }],
          :nested => {
            1 => 2,
            :symbol => 9,
            :string => nil
          }
        }

        symbolized = Util.symbolize_keys(start)
        assert_equal(finish, symbolized)
      end
    end

    context '#sorta_deep_clone' do
      # Super hand wavy test.. but it works for now so whatever.
      should 'clone well enough that we dont accidentally alter json' do
        start = { :a => "abc", :b => [ { :c => "c-1" }, { :c => "c-2" } ] }
        cloned = Util.sorta_deep_clone(start)

        cloned[:a] = "123"
        cloned[:b] << { :c => "c-3" }
        cloned[:b][0][:c] = "c-one"

        assert_equal({ :a => "abc", :b => [ { :c => "c-1" }, { :c => "c-2" } ] }, start)
      end
    end

    context '#constantize' do
      should 'convert :APIResource to the class object' do
        assert_equal(APIResource, Util.constantize(:APIResource))
      end
    end
  end
end
