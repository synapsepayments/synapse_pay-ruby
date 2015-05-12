module SynapsePay
  module Util

    def self.symbolize_keys(obj)
      if obj.is_a?(Hash)
        ret = {}
        obj.each do |key, value|
          ret[(key.to_sym rescue key) || key] = symbolize_keys(value)
        end
        return ret
      elsif obj.is_a?(Array)
        return obj.map{ |value| symbolize_keys(value) }
      else
        return obj
      end
    end

    def self.sorta_deep_clone(json)
      if json.is_a?(Hash)
        ret = {}
        json.each do |k, v|
          ret[k] = sorta_deep_clone(v)
        end
        ret
      elsif json.is_a?(Array)
        json.map{ |j| sorta_deep_clone(j) }
      else
        begin
          json.dup
        rescue
          json
        end
      end
    end

    def self.constantize(str, prefix=false)
      str = str.to_s
      begin
        str.split('::').reduce(Module, :const_get)
      rescue NameError => e
        if prefix
          raise e
        else
          p = "#{self.name}".split("::").first
          constantize("#{p}::#{str}", true)
        end
      end
    end

  end
end
