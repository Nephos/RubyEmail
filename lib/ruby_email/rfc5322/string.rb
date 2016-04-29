require_relative '../rfc5322'

module RubyEmail
  class Rfc5322

    module String
      # Check if the current [::String] instance is a valid email
      # @return [TrueClass or FalseClass]
      def is_email?
        RubyEmail::Rfc5322.validates? self
      end
    end

  end
end

class String
  include RubyEmail::Rfc5322::String
end
