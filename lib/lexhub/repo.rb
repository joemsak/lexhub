module Lexhub
  class Repo < Base
    def initialize(username, repo_name)
      @username  = username
      @repo_name = repo_name
    end

    def commits
      @commits ||= _collect(:commit, 'repos.commits.all')
    end

    def words
      @words ||= commits.collect(&:message).join(' ').split(' ')
    end
  end
end
