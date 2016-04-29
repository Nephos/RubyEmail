#!/usr/bin/env ruby

require "test/unit"

require_relative '../lib/ruby_email'

class TestRubyEmail < Test::Unit::TestCase

  def test_simple_true
    assert RubyEmail::Rfc5322.validates?("toto@toto")
    assert RubyEmail::Rfc5322.validates?("toto@toto.toto")
    assert RubyEmail::Rfc5322.validates?("toto@toto.toto.toto")
    assert RubyEmail::Rfc5322.validates?("toto@toto.toto.toto.toto")
  end

  def test_simple_false
    assert !RubyEmail::Rfc5322.validates?("t")
    assert !RubyEmail::Rfc5322.validates?("t@")
    assert !RubyEmail::Rfc5322.validates?("@t")
  end

  def test_plus_true
    assert RubyEmail::Rfc5322.validates?("i'am%toto@here")
    assert RubyEmail::Rfc5322.validates?("ich-bin-toto@___")
    assert RubyEmail::Rfc5322.validates?("arthur+spam@mail.com")
  end

  def test_plus_false
    assert !RubyEmail::Rfc5322.validates?("i have @ some things")
    assert !RubyEmail::Rfc5322.validates?("toto;toto@toto;toto")
    assert !RubyEmail::Rfc5322.validates?("toto,toto@toto,toto")
    assert !RubyEmail::Rfc5322.validates?("toto()toto@toto()toto")
    assert !RubyEmail::Rfc5322.validates?("toto[]toto@toto[]toto")
    assert !RubyEmail::Rfc5322.validates?("toto:toto@toto:toto")
    assert !RubyEmail::Rfc5322.validates?("toto<>toto@toto<>toto")
    assert !RubyEmail::Rfc5322.validates?("toto\\toto@toto\\toto")
    assert !RubyEmail::Rfc5322.validates?("toto\"toto@toto\"toto")
  end

  def test_match
    m = RubyEmail::Rfc5322.match "toto@toto.toto.toto.toto"
    assert m.names & %w(local domain)
    assert_equal "toto", m["local"]
    assert_equal "toto.toto.toto.toto", m["domain"]
  end

  def test_string
    assert_raise { "toto@toto".is_email? }
    require_relative '../lib/ruby_email/rfc5322/string'
    assert "toto@toto".is_email?
    assert !"toto".is_email?
  end

  def test_exceptions
    assert_raise { RubyEmail::Rfc5322.match 1 }
    assert_raise { RubyEmail::Rfc5322.validates? 1.0 }
    assert_raise { RubyEmail::Rfc5322.validates? /toto/ }
    assert_raise { RubyEmail::Rfc5322.validates? :ok }
    assert_raise { RubyEmail::Rfc5322.validates? Class }
  end

end

class TestRubyEmailPublic < Test::Unit::TestCase
  def test_simpe
    assert RubyEmail::Rfc5322::Public.validates?("toto@toto.toto")
    assert RubyEmail::Rfc5322::Public.validates?("toto@toto.toto.toto")
    assert RubyEmail::Rfc5322::Public.validates?("toto@toto.toto.toto.toto")
    assert !RubyEmail::Rfc5322::Public.validates?("toto@toto")
    assert RubyEmail::Rfc5322::Public.match("toto@toto.toto")
  end

  def test_string
    assert_raise { "toto@toto.toto".is_public_email? }
    require_relative '../lib/ruby_email/rfc5322/public/string'
    assert "toto@toto.toto".is_public_email?
    assert !"toto@toto".is_public_email?
  end
end
