#!/usr/bin/env ruby

require "test/unit"

require_relative '../lib/ruby_email'

class TestRubyEmail < Test::Unit::TestCase

  def test_simple_true
    assert "toto@toto".match RubyEmail::REGEXP
    assert "toto@toto.toto".match RubyEmail::REGEXP
    assert "toto@toto.toto.toto".match RubyEmail::REGEXP
    assert "toto@toto.toto.toto.toto".match RubyEmail::REGEXP
  end

  def test_simple_false
    assert_nil "t".match RubyEmail::REGEXP
    assert_nil "t@".match RubyEmail::REGEXP
    assert_nil "@t".match RubyEmail::REGEXP
  end

  def test_deep
    m = "toto@toto.toto.toto.toto".match RubyEmail::REGEXP
    #require 'pry';binding.pry
    assert m.names & %w(local domain)
    assert_equal "toto", m["local"]
    assert_equal "toto.toto.toto.toto", m["domain"]
  end

end
