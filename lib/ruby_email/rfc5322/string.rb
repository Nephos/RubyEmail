require_relative '../rfc5322'

class String
  include RubyEmail::Rfc5322::String
end
