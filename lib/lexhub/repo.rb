module Lexhub
  class Repo < Base

    def commits
      @results ||= _collect(:commit, 'repos.commits.all')
    end
  end
end
