module Lexhub
  class Repo < Base

    def commits
      @commits ||= _collect(:commit, 'repos.commits.all')
    end

    def words
      @words ||= commits.collect(&:message).join(' ').split(' ')
    end
  end
end
