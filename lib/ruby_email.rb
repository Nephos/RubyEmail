# http://www.ietf.org/rfc/rfc5322.txt
module RubyEmail
  # one valid character (not . because used to separe domains)
  ATEXT = '([A-Za-z0-9!#\$%&\'*\+\-/=\?\^_`\{\}\|~])'
  ATOM = "#{ATEXT}+"
  DOT_ATOM_TEXT = "(#{ATOM})(\\.#{ATOM})*"
  # email grammar
  VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(?<domain>#{DOT_ATOM_TEXT})"
  # regexp to validate complete email
  REGEXP = Regexp.new "\\A#{VALIDE}\\Z"

  # Check if the {::String} is a valid email
  # @param str [::String] string to match
  # @raise [ArgumentError] if str is not a String
  # @return [TrueClass or FalseClass]
  def self.validates? str
    !!match(str)
  end

  # Check if the string is a valid email and details how
  # @param str [::String] string to match
  # @raise [ArgumentError] if str is not a String
  # @return [MatchData or NilClass] matched email with the keys "local" and "domain"
  def self.match str
    raise ArgumentError, "Cannot validate a `#{str.class}`. Only `String` can be." unless str.is_a?(String)
    str.match(REGEXP)
  end

  # included by {::String}
  module String
    # Check if the current [::String] instance is a valid email
    # @return [TrueClass or FalseClass]
    def is_email?
      RubyEmail.validates? self
    end
  end

end

class String
  include RubyEmail::String
end
