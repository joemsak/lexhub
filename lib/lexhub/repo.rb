module Lexhub
  # Wrapper for Github API Repo
  class Repo < Base
    # Public: Gets/Sets the String username of the repo.
    # Public: Gets/Sets the String name of the repo.
    attr_accessor :username, :name

    # Public: Initialize a new Lexhub::Repo
    #
    # username  - the github username of the repo owner
    # name - the name of the repo
    #
    # Examples
    #
    #   repo = Lexhub::Repo.new('joemsak', 'lexhub')
    #
    def initialize(username, name)
      @username  = username
      @name      = name
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
      @response ||= eval("GITHUB.#{api_method}(username, name)")
    end
  end
end
