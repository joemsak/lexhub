require 'active_support/all'
require 'github_api'

require 'lexhub/version'
require 'lexhub/base'
require 'lexhub/repo'

GITHUB_AUTH_TOKEN = ENV['GITHUB_AUTH_TOKEN']
GITHUB = Github.new(:oauth => GITHUB_AUTH_TOKEN)

module Lexhub
end
