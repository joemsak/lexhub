require 'github_api'

require 'lexhub/version'
require 'lexhub/base'
require 'lexhub/repo'

# Internal: Your application's auth token
#
# This will become a config
GITHUB_AUTH_TOKEN = ENV['GITHUB_AUTH_TOKEN']

# Internal: The github object for making API requests
#
# This will become a config
GITHUB = Github.new(:oauth => GITHUB_AUTH_TOKEN)

# Find out the most common words in your commit messages
module Lexhub
end
