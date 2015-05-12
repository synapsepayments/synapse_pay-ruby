require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class PathBuilderTest < ::Test::Unit::TestCase
    class FakeClass
      def abc; return "abc-value"; end
      def self.xyz; return "xyz-value"; end
    end

    setup do
      @params = {
        :dog => "dog-value"
      }
      @obj = FakeClass.new
    end

    should 'use instance methods' do
      path = "/a/:abc/123"
      expected = "/a/abc-value/123"

      actual = PathBuilder.build(path, @obj, nil)
      assert_equal(expected, actual)
    end

    should 'use class methods' do
      path = "/a/:xyz/123"
      expected = "/a/xyz-value/123"

      actual = PathBuilder.build(path, FakeClass, nil)
      assert_equal(expected, actual)
    end

    should 'use param values' do
      path = "/a/:dog/123"
      expected = "/a/dog-value/123"

      actual = PathBuilder.build(path, nil, @params)
      assert_equal(expected, actual)
    end

    should 'use both methods and params' do
      path = "/a/:dog/:abc/123"
      expected = "/a/dog-value/abc-value/123"

      actual = PathBuilder.build(path, @obj, @params)
      assert_equal(expected, actual)
    end

  end
end
