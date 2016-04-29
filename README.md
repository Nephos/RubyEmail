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

"local@domain".is_email? # => true
RubyEmail.validates? "toto@tata" # => true
RubyEmail.match "toto@tata" # => #<MatchData "toto@tata" local:"toto" domain:"tata">
"local".is_email? # => false
RubyEmail.validates? "toto" # => false
RubyEmail.match "toto" # => nil
```


## Usage in Ruby on Rails

```ruby
class Model < ActiveRecord::Base
  validates :email, format: RubyEmail::REGEXP
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
