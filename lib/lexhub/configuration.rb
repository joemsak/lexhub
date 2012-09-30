module Lexhub
  class Configuration
    attr_accessor :oauth_token

    def initialize
      self.oauth_token = nil
    end
  end
end
