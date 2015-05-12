module SynapsePay
  class APIObject
    include Enumerable
    attr_reader :json

    def self.construct(json)
      if json.is_a?(Array)
        return json.map{ |a| APIObject.construct(a) }
      elsif json.is_a?(Hash)
        return APIObject.new(json)
      else
        return json
      end
    end

    def initialize(json=nil)
      refresh_from(json)
    end

    def refresh_from(json={})
      @json = Util.sorta_deep_clone(json)
      @json.each do |k, v|
        @json[k] = APIObject.construct(v)
      end
      self
    end

    def inspect
      @json.inspect
    end

    def to_json(*args)
      JSON.generate(@json)
    end

    def method_missing(name, *args, &blk)
      if name.to_s.end_with?('=')
        attr = name.to_s[0...-1].to_sym
        @json[attr] = args[0]
      else
        if @json.respond_to?(name)
          @json.send(name, *args, &blk)
        elsif @json.has_key?(name.to_sym)
          return @json[name.to_sym]
        else
          super
        end
      end
    end

  end
end
