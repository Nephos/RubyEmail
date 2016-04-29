require_relative 'core'

# http://www.ietf.org/rfc/rfc5322.txt
module RubyEmail

  # Only valid on the public internet. "toto@toto" is not valid, but "toto@toto.toto" is good
  module Public
    # one valid character (not . because used to separe domains)
    ATEXT = '([A-Za-z0-9!#\$%&\'*\+\-/=\?\^_`\{\}\|~])'
    ATOM = "#{ATEXT}+"
    DOT_ATOM_TEXT = "(#{ATOM})(\\.#{ATOM})*"
    VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(?<domain>#{DOT_ATOM_TEXT}\\.#{DOT_ATOM_TEXT})"
    REGEXP = Regexp.new "\\A#{VALIDE}\\Z"

    # Check if the {::String} is a valid email on internet
    # @param str [::String] string to match
    # @raise [ArgumentError] if str is not a String
    # @return [TrueClass or FalseClass]
    def self.validates? str
      !!match(str)
    end

    # Check if the string is a valid email on internet and details how
    # @param str [::String] string to match
    # @raise [ArgumentError] if str is not a String
    # @return [MatchData or NilClass] matched email with the keys "local" and "domain"
    def self.match str
      raise ArgumentError, "Cannot validate a `#{str.class}`. Only `String` can be." unless str.is_a?(String)
      str.match(REGEXP)
    end

    # included by {::String}
    module String
      # Check if the current [::String] instance is a valid email on internet
      # @return [TrueClass or FalseClass]
      def is_public_email?
        RubyEmail::Public.validates? self
      end
    end

  end

end
