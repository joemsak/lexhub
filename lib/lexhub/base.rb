module Lexhub
  class Base
    def initialize(username, repo_name)
      @username  = username
      @repo_name = repo_name
    end

    private
    def _collect_with(method)
      _commits = []

      res = response(method)
      res.each_page do |repo|
        _commits += repo.collect(&:commit)
      end

      _commits
    end

    def response(api_method)
      @response ||= eval("GITHUB.#{api_method}(@username, @repo_name)")
    end
  end
end
