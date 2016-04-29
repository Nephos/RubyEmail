# A RFC compliant Email validator

Complient to the http://www.ietf.org/rfc/rfc5322.txt standard.

## Usage

```ruby
require 'ruby_email'

"local@domain".is_email? # => true
RubyEmail.validates? "toto@tata" # => true
RubyEmail.match "toto@tata" # => #<MatchData "toto@tata" local:"toto" domain:"tata">
"local".is_email? # => false
RubyEmail.validates? "toto" # => false
RubyEmail.match "toto" # => nil
```

## Unitary tests

```sh
rake test
```

## Contributes !

Find a bug ? Want a new feature ?
Create a clear pull request and we'll see :)

- Nephos (poulet_a)
