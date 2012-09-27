module Lexhub
  class Repo
    attr_accessor :username, :repo_name, :commits

    def initialize(username, repo_name)
      @username  = username
      @repo_name = repo_name
      @commits   = collect_commits
    end

    private
    def collect_commits
      @results ||= []
      return @results if @results.any?
      @results = commits_from_all_pages_of_response
    end

    def commits_from_all_pages_of_response
      _commits = []

      response.each_page do |page|
        _commits += page.collect(&:commit)
      end

      _commits
    end

    def response
      @response ||= GITHUB.repos.commits.all(username, repo_name)
    end
  end
end
