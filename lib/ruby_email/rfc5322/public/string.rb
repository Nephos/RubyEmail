require_relative '../public'

class String
  include RubyEmail::Rfc5322::Public::String
end
