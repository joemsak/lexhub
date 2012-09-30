module Lexhub
  # The Lexhub Configuration singleton
  class Configuration
    # Public: Gets/Sets String oauth_token
    attr_accessor :oauth_token

    def initialize
      self.oauth_token = nil
    end
  end
end
