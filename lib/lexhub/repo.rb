module Lexhub
  # Wrapper for Github API Repo
  class Repo < Base
    # Public: Initialize a new Lexhub::Repo
    #
    # username  - the github username of the repo owner
    # repo_name - the name of the repo
    #
    # Examples
    #
    #   repo = Lexhub::Repo.new('joemsak', 'lexhub')
    #
    def initialize(username, repo_name)
      @username  = username
      @repo_name = repo_name
    end

    # Public: Get the commits of the named repo
    #
    # Examples
    #
    #   repo.commits
    #   # => [#<Hashie::Mash author=...>, #<Hashie::Mash author...>]
    #
    #   # same as if you had done:
    #   #
    #   # github = Github.new(:oauth_token => 'abc123...')
    #   # github.repos.commits.all('joemsak', 'lexhub')
    #
    # Returns Array commits
    def commits
      @commits ||= _collect(:commit, 'repos.commits.all')
    end

    # Public: Collect the words of all commit messages
    #
    # Examples
    #
    #   repo.words
    #   # => ['a', 'bunch', 'of', 'words']
    #
    # Returns Array all commit message words
    def words
      @words ||= commits.collect(&:message).join(' ').split(' ')
    end

    private
    # Internal: Get a response from the Github API
    #
    # api_method - String Github method chain
    #
    # Returns the response from Github
    def response(api_method)
      @response ||= eval("GITHUB.#{api_method}(@username, @repo_name)")
    end
  end
end
