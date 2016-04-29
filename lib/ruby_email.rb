module RubyEmail

  ATEXT = '([\w!#\$%&\'*\+\-/=\?\^_`\{\}\|~])'
  #ATEXT = '\w'
  ATOM = "#{ATEXT}+"
  DOT_ATOM_TEXT = "(#{ATOM})(\.#{ATOM})*"
  VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(?<domain>#{DOT_ATOM_TEXT})"
  REGEXP = Regexp.new "\\A#{VALIDE}\\Z"

end
