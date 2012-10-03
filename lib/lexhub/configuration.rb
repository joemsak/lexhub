# Returns Array the default excluded words
EXCLUDED_WORDS = %w(the a it but and that with for to from)

module Lexhub
  # The Lexhub Configuration singleton
  class Configuration
    # Public: Gets/Sets String oauth_token
    attr_accessor :oauth_token

    # Public: Gets/Sets Github github
    attr_accessor :github

    # Public: Gets/Sets Array excluded_words
    attr_accessor :excluded_words

    def initialize
      self.oauth_token    = nil
      self.github         = nil
      self.excluded_words = EXCLUDED_WORDS
    end
  end
end
