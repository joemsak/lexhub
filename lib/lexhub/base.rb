module Lexhub
  class Base
    def initialize(username, repo_name)
      @username  = username
      @repo_name = repo_name
    end

    private
    def _collect(collection_method, api_method)
      results = []

      begin
        response(api_method).each_page do |page|
          results += page.collect(&collection_method)
        end
      ensure
        return results
      end
    end

    def response(api_method)
      @response ||= eval("GITHUB.#{api_method}(@username, @repo_name)")
    end
  end
end
