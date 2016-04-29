Gem::Specification.new do |s|
  s.name        = 'ruby_email'
  s.version     = File.read("version")
  s.date        = Time.now.getgm.to_s.split.first
  s.summary     = File.read("CHANGELOG").match(/^v[^\n]+\n((\t[^\n]+\n)+)/m)[1].split("\t").join
  s.description = 'A RFC compliant email validator'
  s.authors     = ['Nephos (poulet_a)']
  s.email       = ['arthur.poulet@mailoo.org']
  s.files       = %w(
lib/ruby_email.rb
lib/ruby_email/core.rb
lib/ruby_email/rfc5322.rb
lib/ruby_email/rfc5322/string.rb
lib/ruby_email/rfc5322/public.rb
lib/ruby_email/rfc5322/public/string.rb
lib/ruby_email/rfc1123.rb
lib/ruby_email/rfc1123/string.rb
lib/ruby_email/rfc1123/public.rb
lib/ruby_email/rfc1123/public/string.rb

README.md
CHANGELOG

Rakefile
Gemfile
Gemfile.lock
ruby_email.gemspec
version

test/unit_test.rb
test/rfc1123.rb
test/rfc5322.rb
)
  s.executables = %w(
)
  s.homepage    = 'https://github.com/Nephos/RubyEmail'
  s.license     = 'WTFPL'

  s.cert_chain  = ['certs/nephos.pem']
  s.signing_key = File.expand_path('~/.ssh/gem-private_key.pem') if $0 =~ /gem\z/

  # s.add_dependency 'nephos', '~> 1.0'
  s.add_dependency 'nomorebeer', '~> 1.1'

end
