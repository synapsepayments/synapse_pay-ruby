# SynapsePay Ruby Bindings [![Code Climate](https://codeclimate.com/github/synapsepayments/synapse_pay-ruby/badges/gpa.svg)](https://codeclimate.com/github/synapsepayments/synapse_pay-ruby)

[![API Library via Apibits.com](http://apibits.com/assets/images/apibits-badge.png)](http://apibits.com)

## Installation

Add this line to your Gemfile:

```ruby
gem 'synapse_pay'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install synapse_pay
```


## Documentation

Documentation is available at [http://api.synapsepay.com/v2.0](http://api.synapsepay.com/v2.0).


## Samples

See [samples.md](https://github.com/synapsepayments/synapse_pay-ruby/blob/master/samples.md) for sample usage in ruby.


## Requirements

* Ruby 1.8.7 or above. (Ruby 1.8.6 may work if you load ActiveSupport.) For Ruby versions before 1.9.2, you'll need to add this to your Gemfile:

```ruby
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.9.2')
  gem 'rest-client', '~> 1.6.8'
end
```

* rest-client, json


## Development

Clone the repo and install:

```sh
git clone https://github.com/synapsepayments/synapse_pay-ruby.git
bundle install
```

Load the gem in an IRB console:

```sh
bundle console
```

Test cases can be run with:

```sh
bundle exec rake test
```
