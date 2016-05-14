require_relative '../rfc1123'

module RubyEmail
  class Rfc1123

    # Internet realist version of {Rfc5322}. It requires 2 names (a.b).
    class Public < Rfc1123
      DOT_ATOM_TEXT = "((#{ATOM_ALL}\\.)+#{ATOM_FIRST})"
      VALIDE = "(?<domain>(?!.{254,})((#{DOT_ATOM_TEXT})))"
      REGEXP = Regexp.new "\\A#{VALIDE}\\Z"

      module String
        # Check if the current [::String] instance is a valid domain on internet
        # @return [TrueClass or FalseClass]
        def is_public_domain?
          RubyEmail::Rfc1123::Public.validates? self
        end
      end
    end

  end
end
