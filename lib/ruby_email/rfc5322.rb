require_relative 'core'

module RubyEmail

  # http://www.ietf.org/rfc/rfc5322.txt
  # The Rfc5322 designe an email with the format local@domain, wher local and
  # domain are a string of US-ASCII characters, without some symboles.
  class Rfc5322 < Core
    # one valid character (not . because used to separe domains)
    ATEXT = '([A-Za-z0-9!#\$%&\'*\+\-/=\?\^_`\{\}\|~])'
    # a valid string
    ATOM = "#{ATEXT}+"
    # a valid string with subdomains, separated by dots
    DOT_ATOM_TEXT = "(#{ATOM})(\\.#{ATOM})*"
    # email grammar
    VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(?<domain>#{DOT_ATOM_TEXT})"
    # regexp to validate complete email
    REGEXP = Regexp.new "\\A#{VALIDE}\\Z"
    module String
      # Check if the current [::String] instance is a valid email
      # @return [TrueClass or FalseClass]
      def is_email?
        RubyEmail::Rfc5322.validates? self
      end
    end
  end

end
