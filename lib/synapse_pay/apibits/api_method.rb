module SynapsePay
  class APIMethod

    attr_accessor :path
    attr_accessor :method
    attr_accessor :params
    attr_accessor :headers

    attr_accessor :response_body
    attr_accessor :response_code
    attr_accessor :error

    attr_accessor :api_base

    def initialize(method, path, params, headers, object)
      @api_base = api_base || SynapsePay.api_base

      @method = method.to_sym
      @path = PathBuilder.build(path, object, params)
      @params = ParamsBuilder.build(params)
      @headers = HeadersBuilder.build(headers)
    end

    def execute
      begin
        response = Requester.request(method, url, params, headers)
        @response_body = response.body
        @response_code = response.code
      rescue StandardError => e
        @response_body = e.http_body if e.respond_to?(:http_body)
        @response_code = e.http_code if e.respond_to?(:http_code)
        @error = compose_error(e)
        raise @error
      end

      if(!response_json[:success])
        @error = APIError.new(response_json, self)
        raise @error
      end
      response_json
    end

    def url
      "#{api_base}#{@path}"
    end

    def response_json
      return @json if @json
      begin
        @json = Util.symbolize_keys(JSON.parse(@response_body))
      rescue JSON::ParserError
        @error = APIError.new("Unable to parse the server response as JSON.", self)
        raise @error
      end
      @json
    end

    def compose_error(error)
      msg = "An error occured while making the API call."

      case error
      when RestClient::ExceptionWithResponse
        return error_with_response(error)

      when RestClient::RequestTimeout
        msg = "The request timed out while making the API call."

      when RestClient::ServerBrokeConnection
        msg = "The connection to the server broke before the request completed."

      when SocketError
        msg = "An unexpected error occured while trying to connect to " \
          "the API. You may be seeing this message because your DNS is " \
          "not working. To check, try running 'host #{SynapsePay.api_base}' "\
          "from the command line."

      else
        msg = "An unexpected error occured. If this problem persists let us " \
          "know at #{SynapsePay.support_email}."
      end

      return APIConnectionError.new(msg, self)
    end

    # Handle a few common cases.
    def error_with_response(error)
      case @response_code
      when 400, 404
        return APIError.new(@response_body || "Invalid request. Please check the URL and parameters.", self)
      when 401
        return AuthenticationError.new(@response_body || "Authentication failed.", self)
      else
        return APIError.new(@response_body || "An error occured while making the API call.", self)
      end
    end
  end
end
