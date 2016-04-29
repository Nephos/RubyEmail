require_relative '../rfc5322'

module RubyEmail
  class Rfc5322

    # Internet realist version of {Rfc5322}. It requires a root domain.
    class Public < Rfc5322
      DOMAIN_DOT_ATOM_TEXT = "(?=.{1,253})((#{DOMAIN_ATOM_ALL}\\.)+#{DOMAIN_ATOM_FIRST})"
      VALIDE = "(?<local>#{LOCAL_DOT_ATOM_TEXT})@(?<domain>#{DOMAIN_DOT_ATOM_TEXT})"
      REGEXP = Regexp.new "\\A#{VALIDE}\\Z"

      module String
        # Check if the current [::String] instance is a valid email
        # @return [TrueClass or FalseClass]
        def is_public_email?
          RubyEmail::Rfc5322::Public.validates? self
        end
      end
    end

  end
end
