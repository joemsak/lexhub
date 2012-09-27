require 'github_api'
Dir.glob("lib/**/*.rb").each { |f| require [".", "/", f].join }

GITHUB_AUTH_TOKEN = ENV['GITHUB_AUTH_TOKEN']
GITHUB = Github.new(:oauth => GITHUB_AUTH_TOKEN)

module Lexhub
end
