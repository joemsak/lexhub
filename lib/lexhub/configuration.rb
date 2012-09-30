module Lexhub
  # The Lexhub Configuration singleton
  class Configuration
    # Public: Gets/Sets String oauth_token
    attr_accessor :oauth_token

    # Public: Gets/Sets Github github
    attr_accessor :github

    def initialize
      self.oauth_token = nil
      self.github      = nil
    end
  end
end
