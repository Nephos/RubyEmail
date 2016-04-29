require_relative '../rfc5322'

module RubyEmail
  class Rfc5322

    # Internet realist version of {Rfc5322}. It requires a root domain.
    class Public < Rfc5322
      VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(?<domain>#{DOT_ATOM_TEXT}\\.#{DOT_ATOM_TEXT})"
      REGEXP = Regexp.new "\\A#{VALIDE}\\Z"
    end

  end
end
