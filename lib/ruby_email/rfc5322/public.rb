require_relative '../rfc5322'
require_relative '../rfc1123/public'

module RubyEmail
  class Rfc5322

    # Internet realist version of {Rfc5322}. It requires a root domain.
    class Public < Rfc5322
      VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(#{Rfc1123::Public::VALIDE})"
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
