module SynapsePay
  module Requester

    def self.request(method, url, params, headers)
      method = method.to_sym
      url, params = prepare_params(method, url, params, headers)
      request_opts = {
        method: method,
        url: url,
        headers: headers,
        payload: params,
        verify_ssl: false,
        open_timeout: 30,
        timeout: 60
      }

      execute_request(request_opts)
    end

    def self.execute_request(opts)
      RestClient::Request.execute(opts)
    end

    def self.get(url, params, headers)
      self.request(:get, url, params, headers)
    end

    def self.delete(url, params, headers)
      self.request(:delete, url, params, headers)
    end

    def self.put(url, params, headers)
      self.request(:put, url, params, headers)
    end

    def self.post(url, params, headers)
      self.request(:post, url, params, headers)
    end

    def self.prepare_params(method, url, params, headers)
      if [:get, :head, :delete].include?(method)
        unless params.empty?
          url += URI.parse(url).query ? '&' : '?' + query_string(params)
        end
        params = nil
      else
        if headers["Content-Type"] == "application/json" || headers[:"Content-Type"] == "application/json"
          params = JSON.generate(params)
        else
          headers["Content-Type"] = "application/x-www-form-urlencoded"
          if !RestClient::Payload.has_file?(params)
            params = query_string(params)
          end
        end
      end
      [url, params]
    end

    def self.query_string(params)
      params ||= {}
      if params.any?
        query_array(params).join('&')
      else
        ""
      end
    end

    # Three major use cases (and nesting of them needs to be supported):
    #   { :a => { :b => "bvalue" } }  => ["a[b]=bvalue"]
    #   { :a => [1, 2] }           => ["a[]=1", "a[]=2"]
    #   { :a => "value" }          => ["a=value"]
    def self.query_array(params, key_prefix = nil)
      ret = []
      params.each do |key, value|
        if params.is_a?(Array)
          value = key
          key = ''
        end
        key_suffix = escape(key)
        full_key = key_prefix ? "#{key_prefix}[#{key_suffix}]" : key_suffix

        if value.is_a?(Hash) || value.is_a?(Array)
          # Handles the following cases:
          #   { :a => { :b => "bvalue" } }  => ["a[b]=bvalue"]
          #   { :a => [1, 2] }           => ["a[]=1", "a[]=2"]
          ret += query_array(value, full_key)
        elsif value.is_a?(APIObject)
          ret += query_array(value.json, full_key)
        else
          # Handles the base case with just key and value:
          #   { :a => "value" } => ["a=value"]
          ret << "#{full_key}=#{escape(value)}"
        end
      end
      ret
    end

    def self.escape(val)
      URI.escape(val.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    end
  end
end
