module Lexhub
  # Base class for API interaction
  class Base
    private
    # Internal: Collect items from API endpoints
    #
    # collection_item - Symbol name of item to collect
    # api_method      - String Github method chain
    def _collect(collection_item, api_method)
      results = []

      response(api_method).each_page do |page|
        results += page.collect(&collection_item)
      end

      results
    end

    # Internal: Get a response from the Github API
    #
    # api_method - String Github method chain
    #
    # Returns the response from Github
    def response(api_method)
      @response ||= eval("GITHUB.#{api_method}(@username, @repo_name)")
    end
  end
end
