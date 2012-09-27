module Lexhub
  class Base
    def initialize(username, repo_name)
      @username  = username
      @repo_name = repo_name
    end

    private
    def _collect(collection_method, api_method)
      results = []

      response(api_method).each_page do |page|
        results += page.collect(&collection_method)
      end

      results
    end

    def response(api_method)
      @response ||= eval("GITHUB.#{api_method}(@username, @repo_name)")
    end
  end
end
