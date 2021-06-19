# A RFC compliant Email validator

[![Build Status](https://drone.sceptique.eu/api/badges/Sceptique/RubyEmail/status.svg)](https://drone.sceptique.eu/Sceptique/RubyEmail)

- What is an [Email Address](https://en.wikipedia.org/wiki/Email_address) ?
- What is a [Domain Name](https://en.wikipedia.org/wiki/Hostname) ?

- Compliant to the [Rfc 5322](https://tools.ietf.org/html/rfc5322).
- Compliant to the [Rfc 1123](https://tools.ietf.org/html/rfc1123).

- To do [rfc 6530](https://tools.ietf.org/html/rfc6530).


## Installation

```sh
gem install ruby_email
```

or in the ``Gemfile``

```ruby
gem 'ruby_email'
```


## Usage in Ruby

```ruby
require 'ruby_email'

# Pure Rfc5322
RubyEmail::Rfc5322.validates? "toto@tata" # => true
RubyEmail::Rfc5322.match "toto@tata" # => #<MatchData "toto@tata" local:"toto" domain:"tata">
RubyEmail::Rfc5322.validates? "toto" # => false
RubyEmail::Rfc5322.match "toto" # => nil

# Rfc5322 + Internet basic usage
RubyEmail::Rfc5322::Public.validates? "toto@tata.com" # => true
RubyEmail::Rfc5322::Public.match "toto@tata.com" # => #<MatchData "toto@tata" local:"toto" domain:"tata.com">

# Rfc5322 Strings
require 'ruby_email/rfc5322/string'
"local@domain".is_email? # => true
"local".is_email? # => false

# Rfc5322 Strings + Internet basic usage
require 'ruby_email/rfc5322/public/string'
"local@domain.root".is_public_email? # => true
"local@domain".is_public_email? # => false

```


## Usage in Ruby on Rails

```ruby
class Model < ActiveRecord::Base
  # validates :email, format: RubyEmail::Rfc5322::REGEXP # valid on an intranet ...
  validates :email, format: RubyEmail::Rfc5322::Public::REGEXP
end
```


## Unitary tests

```sh
rake test
```


## Contributes !

Find a bug ? Want a new feature ?
Create a clear pull request and we'll see :)

- [Sceptique](https://git.sceptique.eu/Sceptique)
