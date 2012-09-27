module Lexhub
  class Repo < Base

    def commits
      @results ||= []
      return @results if @results.any?
      @results = _collect_with('repos.commits.all')
    end
  end
end
