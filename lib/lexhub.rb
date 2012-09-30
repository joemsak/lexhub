require 'github_api'

require 'lexhub/version'
require 'lexhub/configuration'
require 'lexhub/base'
require 'lexhub/repo'

# Find out the most common words in your commit messages
module Lexhub
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end
end

Lexhub.configure do |config|
  config.oauth_token = ENV['GITHUB_AUTH_TOKEN']
end

GITHUB = Github.new(:oauth_token => Lexhub.configuration.oauth_token)
