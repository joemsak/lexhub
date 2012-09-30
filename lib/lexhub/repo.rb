module Lexhub
  # Wrapper for Github API Repo
  class Repo < Base
    # Public: Gets/Sets the String username of the repo's owner.
    attr_accessor :username

    # Public: Gets/Sets the String name of the repo.
    attr_accessor :name

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
    #   # => { 'a'    => { :count => 1 },
    #          'word' => { :count => 3 } }
    #
    # Returns Hash all commit message words with their count
    def words
      return @words if defined?(@words)
      keys   = downcased_commit_message_words
      @words = counted_words(keys)
    end

    private
    # Internal: Count the keys
    #
    # Returns Hash unique words with their counts
    def counted_words(keys)
      words = {}

      keys.uniq.each do |k|
        words[k] = { :count => keys.count(k) }
      end

      words
    end

    # Internal: Turn the commit messages into an array of words
    #
    # Returns Array downcased commit message words
    def downcased_commit_message_words
      commits.collect(&:message)
             .join(' ')
             .split(' ')
             .map(&:downcase)
    end

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
