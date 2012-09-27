module Lexhub
  class Repo
    def initialize(username, repo_name)
      @username  = username
      @repo_name = repo_name
    end

    def commits
      @commits ||= GITHUB.repos.commits
                         .all(@username, @repo_name)
                         .collect(&:commit)
    end
  end
end
