#!/usr/bin/env ruby

require "test/unit"

require_relative '../lib/ruby_email'

class TestRubyEmail < Test::Unit::TestCase

  def test_simple_true
    assert RubyEmail.validates?("toto@toto")
    assert RubyEmail.validates?("toto@toto.toto")
    assert RubyEmail.validates?("toto@toto.toto.toto")
    assert RubyEmail.validates?("toto@toto.toto.toto.toto")
  end

  def test_simple_false
    assert !RubyEmail.validates?("t")
    assert !RubyEmail.validates?("t@")
    assert !RubyEmail.validates?("@t")
  end

  def test_plus_true
    assert RubyEmail.validates?("i'am%toto@here")
    assert RubyEmail.validates?("ich-bin-toto@___")
    assert RubyEmail.validates?("arthur+spam@mail.com")
  end

  def test_plus_false
    assert !RubyEmail.validates?("i have @ some things")
    assert !RubyEmail.validates?("toto;toto@toto;toto")
    assert !RubyEmail.validates?("toto,toto@toto,toto")
    assert !RubyEmail.validates?("toto()toto@toto()toto")
    assert !RubyEmail.validates?("toto[]toto@toto[]toto")
    assert !RubyEmail.validates?("toto:toto@toto:toto")
    assert !RubyEmail.validates?("toto<>toto@toto<>toto")
    assert !RubyEmail.validates?("toto\\toto@toto\\toto")
    assert !RubyEmail.validates?("toto\"toto@toto\"toto")
  end

  def test_match
    m = RubyEmail.match "toto@toto.toto.toto.toto"
    assert m.names & %w(local domain)
    assert_equal "toto", m["local"]
    assert_equal "toto.toto.toto.toto", m["domain"]
  end

  def test_string
    assert !"toto".is_email?
    assert "toto@toto".is_email?
  end

  def test_exceptions
    assert_raise { RubyEmail.match 1 }
    assert_raise { RubyEmail.validates? 1.0 }
    assert_raise { RubyEmail.validates? /toto/ }
    assert_raise { RubyEmail.validates? :ok }
    assert_raise { RubyEmail.validates? Class }
  end

end
