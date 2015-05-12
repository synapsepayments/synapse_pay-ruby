module SynapsePay
  class RunTestList < APIList
    attr_accessor :parent_id

    def initialize(json={}, api_method=nil, parent_id=nil)
      refresh_from(json, api_method, parent_id)
    end

    def refresh_from(json={}, api_method=nil, parent_id=nil)
      @klass = Util.constantize(:Test)
      @parent_id = parent_id || @parent_id
      super(json, api_method)
    end

    def all(params={}, headers={})
      method = APIMethod.new(:get, "/runs/:parent_id/tests", params, headers, self)
      self.refresh_from(method.execute, method, parent_id)
    end

    def retrieve(id, params={}, headers={})
      params = ParamsBuilder.merge(params, {
        :id => id,
      })
      method = APIMethod.new(:get, "/runs/:parent_id/tests/:id", params, headers, self)
      Util.constantize(:Test).new(method.execute, method)
    end

    @api_attributes = {
      :data => { :readonly => true }
    }
  end
end
