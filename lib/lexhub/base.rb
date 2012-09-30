module Lexhub
  # Base class for API interaction
  class Base
    private
    # Internal: The Github object
    #
    # Returns Github object
    def _github
      Lexhub.configuration.github
    end

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
  end
end
