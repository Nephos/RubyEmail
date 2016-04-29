require_relative 'core'

module RubyEmail

  # an Email Address follows the Rfc5322: http://www.ietf.org/rfc/rfc5322.txt
  # a Domain Name follows the Rfc1123: https://tools.ietf.org/html/rfc1123
  # The Rfc5322 designate an email with the format local@domain, where
  # - local is a string of US-ASCII characters, without some symboles.
  # - domain is a valid Domain Name

  class Rfc5322 < Core
    # one valid character for local part (do not take escaped because the Rfc prefere to avoid them)
    LOCAL_ATEXT = '([A-Za-z0-9!#\$%&\'*\+\-/=\?\^_`\{\}\|~])'
    # one valid character for domain part (first name first character)
    DOMAIN_ATEXT_FIRST_FIRST = '([A-Za-z])'
    # one valid character for domain part (first name all other characters)
    DOMAIN_ATEXT_FIRST_ALL = '([A-Za-z0-9])'
    # one valid character for domain part (all other names)
    DOMAIN_ATEXT_ALL = '([A-Za-z0-9\-])'

    # a valid string for local part
    LOCAL_ATOM = "#{LOCAL_ATEXT}+"
    # a valid string for domain part (first name)
    DOMAIN_ATOM_FIRST = "#{DOMAIN_ATEXT_FIRST_FIRST}#{DOMAIN_ATEXT_ALL}{,62}"
    # a valid string for domain part (all other names)
    DOMAIN_ATOM_ALL = "#{DOMAIN_ATEXT_FIRST_ALL}#{DOMAIN_ATEXT_ALL}{,62}"

    # a valid string with subdomains, separated by dots for local part
    LOCAL_DOT_ATOM_TEXT = "(#{LOCAL_ATOM})(\\.#{LOCAL_ATOM})*"
    # a valid string with subdomains, separated by dots for domain part as IPV4
    DOMAIN_IPV4 = '(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'
    # a valid string with subdomains, separated by dots for domain part as Domain Name
    DOMAIN_DOT_ATOM_TEXT = "(?=.{1,253})((#{DOMAIN_ATOM_ALL}\\.)*#{DOMAIN_ATOM_FIRST})"

    # email grammar
    VALIDE = "(?<local>#{LOCAL_DOT_ATOM_TEXT})@(?<domain>((#{DOMAIN_DOT_ATOM_TEXT})|(#{DOMAIN_IPV4})))"

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
