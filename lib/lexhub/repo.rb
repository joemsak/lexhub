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
      @words ||= counted_words(downcased_commit_message_words)
    end

    # Public: Show the most used words in commit messages
    #
    # Examples
    #
    #   repo.most_used_word
    #   #=> ['Fuckbeans', 'sucks']
    #
    # Returns Array the most used words in your commit messages
    def most_used_words
      max_count = words.values.collect { |v| v[:count] }.max
      words.select { |_, v| v[:count] == max_count }.keys
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

    # Internal: Downcase the commit message words
    #
    # Returns Array downcased commit message words
    def downcased_commit_message_words
      sanitized_message_words.map(&:downcase)
    end

    # Internal: Sanitize excluded words from commit messages
    #
    # Returns Array sanitized commit message words
    def sanitized_message_words
      commit_message_words.reject { |w| _excluded_words.include?(w) }
    end

    # Internal: Collect words from commit messages
    #
    # Returns Array commit message words
    def commit_message_words
      commits.collect(&:message).join(' ').split(' ')
    end

    # Internal: Get a response from the Github API
    #
    # api_method - String Github method chain
    #
    # Returns the response from Github
    def response(api_method)
      @response ||= eval("_github.#{api_method}(username, name)")
    end
  end
end
