require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class ParamsBuilderTest < ::Test::Unit::TestCase

    setup do
      @params = {
        :dog => "dog-value",
        "string" => "str-value"
      }
    end

    context '#clean' do
      setup do
        @built_params = ParamsBuilder.clean(@params)
      end

      should 'convert keys to symbols' do
        assert(@built_params.has_key?(:string))
        assert_equal(@params["string"], @built_params[:string])
      end

      should 'not have any string keys' do
        @built_params.each do |k, v|
          assert(k.is_a?(Symbol))
        end
      end
    end

    context '#merge' do
      setup do
        @to_merge = {
          :string => "other-str-value",
          "cat" => "cat-value"
        }
        @built_params = ParamsBuilder.merge(@params, @to_merge)
      end

      should 'convert keys to symbols' do
        assert(@built_params.has_key?(:cat))
        assert(@built_params.has_key?(:string))
        assert(!@built_params.has_key?("string"))
      end

      should 'merge in all values' do
        assert_equal(@params[:dog], @built_params[:dog])
        assert_equal(@to_merge[:string], @built_params[:string])
        assert_equal(@to_merge["cat"], @built_params[:cat])
      end

      should 'prioritize values in @to_merge' do
        assert_equal(@to_merge[:string], @built_params[:string])
      end
    end

  end
end
