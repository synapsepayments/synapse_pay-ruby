module SynapsePay
  class APIList < APIResource
    include Enumerable

    attr_reader :data
    attr_reader :klass
    attr_reader :client

    def initialize(klass, json={}, api_method=nil, client=nil)
      if klass.is_a?(Class)
        @klass = klass
      else
        @klass = Util.constantize(klass)
      end

      refresh_from(json, api_method, client)
    end

    def refresh_from(json, api_method=nil, client=nil)
      unless json.is_a?(Hash)
        json = {
          :data => json
        }
      end
      json = Util.symbolize_keys(json)

      clear_api_attributes
      @api_method = api_method
      @client = client
      @data = []
      @json = Util.sorta_deep_clone(json)

      json.each do |k, v|
        if k.to_sym == :data
          if v.respond_to?(:map)
            instance_variable_set("@#{k}", v.map{ |i| @klass.new(i, @api_method, @client) })
          else
            instance_variable_set("@#{k}", v || [])
          end
        elsif self.class.api_attribute_names.include?(k)
          instance_variable_set("@#{k}", determine_api_attribute_value(k, v))
        end
      end
      self
    end

    def [](k)
      data[k]
    end

    def []=(k, v)
      data[k]=v
    end

    def last
      data.last
    end

    def length
      data.length
    end

    def each(&blk)
      data.each(&blk)
    end

    def inspect
      "#<#{self.class}[#{@klass}]:0x#{self.object_id.to_s(16)}> Data: " + JSON.pretty_generate(inspect_data)
    end

    def inspect_data
      ret = []
      data.each do |d|
        if d.respond_to?(:inspect_nested)
          ret << d.inspect_nested
        else
          ret << d
        end
      end
      ret
    end


    @api_attributes = {
      :data => { :readonly => true }
    }
  end
end
