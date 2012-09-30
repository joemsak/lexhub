module Lexhub
  class Base
    private
    def _collect(collection_item, api_method)
      results = []

      response(api_method).each_page do |page|
        results += page.collect(&collection_item)
      end

      results
    end

    def response(api_method)
      @response ||= eval("GITHUB.#{api_method}(@username, @repo_name)")
    end
  end
end
