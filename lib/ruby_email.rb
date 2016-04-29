module RubyEmail
  # http://www.ietf.org/rfc/rfc5322.txt

  ATEXT = '([A-Za-z0-9!#\$%&\'*\+\-/=\?\^_`\{\}\|~])'
  #ATEXT = '\w'
  ATOM = "#{ATEXT}+"
  DOT_ATOM_TEXT = "(#{ATOM})(\\.#{ATOM})*"
  VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(?<domain>#{DOT_ATOM_TEXT})"
  REGEXP = Regexp.new "\\A#{VALIDE}\\Z"

  def self.validates? str
    !!match(str)
  end

  def self.match str
    raise ArgumentError, "Cannot validates a `#{str.class}`. Only `String` can be." unless str.is_a?(String)
    str.match(REGEXP)
  end

  module String
    def is_email?
      RubyEmail.validates? self
    end
  end

end

class String
  include RubyEmail::String
end
