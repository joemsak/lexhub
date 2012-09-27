module Lexhub
  class Repo < Base

    def commits
      @results ||= []
      return @results if @results.any?
      @results = _collect(:commit, 'repos.commits.all')
    end
  end
end
