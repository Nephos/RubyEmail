require_relative '../public'

module RubyEmail
  class Rfc5322
    class Public

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

class String
  include RubyEmail::Rfc5322::Public::String
end
