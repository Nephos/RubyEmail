require_relative '../public'

class String
  include RubyEmail::Rfc1123::Public::String
end
