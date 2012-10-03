require 'github_api'

require 'lexhub/version'
require 'lexhub/configuration'
require 'lexhub/base'
require 'lexhub/repo'

# Find out the most common words in your commit messages
module Lexhub
  class << self
    # Public Gets/Sets Configuration configuration
    attr_accessor :configuration

    # Public: Configure the gem
    #
    # Examples
    #
    #   Lexhub.configure do |config|
    #     config.oauth_token = '123abc'
    #   end
    #
    # Returns Configuration object
    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end
  end
end

Lexhub.configure do |config|
  config.oauth_token = ENV['GITHUB_AUTH_TOKEN']
  config.github      = Github.new(:oauth_token => config.oauth_token)
end
