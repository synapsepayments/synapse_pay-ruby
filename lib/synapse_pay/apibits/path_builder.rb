module SynapsePay
  module PathBuilder

    # Take a path like:
    #   ":path/:id/dogs/:dog_id"
    # and convert it to:
    #   "#{object.path}/#{object.id}/dogs/#{params[:id]}" => "/objects/1/dogs/2"
    #
    # Path priority is:
    #   1. Object - this will be a class or an instance of a class.
    #   2. Params - this is a hash of key values. All keys *must* be symbolized.
    def self.build(path, object, params)
      ret = path.dup
      if ret.include?(":")
        matches = ret.scan(/:([^\/]*)/).flatten.map(&:to_sym)
        missing = Set.new(matches)

        matches.each do |match|
          value = determine_value(match, object, params)
          missing.delete(match) unless value.nil?
          ret.sub!(match.inspect, "#{value}")
        end

        if missing.any?
          raise ArgumentError.new("Could not determine the full URL. The following values of the path are missing: #{missing.to_a.join(', ')}. Try setting them in your params.")
        end
      end
      ret
    end

    def self.determine_value(match, object, params)
      value = object.send(match) if object && object.respond_to?(match)
      value ||= params[match] if params && params.has_key?(match)
      value
    end
  end
end
