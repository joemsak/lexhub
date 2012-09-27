module Lexhub
  class Repo < Base

    def commits
      @commits ||= _collect(:commit, 'repos.commits.all')
    end
  end
end
