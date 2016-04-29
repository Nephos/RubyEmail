# A RFC compliant Email validator

Compliant to the [rfc 5322](http://www.ietf.org/rfc/rfc5322.txt) standard.

## Installation

```sh
gem install ruby_email
```

or in the ``Gemfile``

```ruby
gem 'ruby_email'
```


## Usage in Ruby

```ruby
require 'ruby_email'

# Pure Rfc5322
RubyEmail::Rfc322.validates? "toto@tata" # => true
RubyEmail::Rfc322.match "toto@tata" # => #<MatchData "toto@tata" local:"toto" domain:"tata">
RubyEmail::Rfc322.validates? "toto" # => false
RubyEmail::Rfc322.match "toto" # => nil

# Rfc5322 + Internet basic usage
RubyEmail::Rfc322::Public.validates? "toto@tata.com" # => true
RubyEmail::Rfc322::Public.match "toto@tata.com" # => #<MatchData "toto@tata" local:"toto" domain:"tata.com">

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
  # validates :email, format: RubyEmail::Rfc322::REGEXP # valid on an intranet ...
  validates :email, format: RubyEmail::Rfc322::Public::REGEXP
end
```


## Unitary tests

```sh
rake test
```


## Contributes !

Find a bug ? Want a new feature ?
Create a clear pull request and we'll see :)

- Nephos (poulet_a)
