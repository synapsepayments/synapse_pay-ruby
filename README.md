# SynapsePay Ruby Bindings [![Code Climate](https://codeclimate.com/github/synapsepayments/synapse_pay-ruby/badges/gpa.svg)](https://codeclimate.com/github/synapsepayments/synapse_pay-ruby)

[![API Library via Apibits.com](http://apibits.com/assets/images/apibits-badge.png)](http://apibits.com)

## Installation

You don't need this source code unless you want to modify the gem. If
you just want to use the SynapsePay Ruby bindings, you should run:

```bash
gem install synapse_pay
```

If you want to build & install the gem from source:

```bash
gem build synapse_pay.gemspec
gem install synapse_pay-0.0.1.gem
```

## Documentation

Documentation is available at [http://synapsepay.readme.io/v1.0/docs/](http://synapsepay.readme.io/v1.0/docs/).


## Samples

See [samples.md](https://github.com/synapsepayments/synapse_pay-ruby/blob/master/samples.md) for sample usage in ruby.


## Requirements

* Ruby 1.8.7 or above. (Ruby 1.8.6 may work if you load
  ActiveSupport.) For Ruby versions before 1.9.2, you'll need to add this to your Gemfile:

```ruby
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('1.9.2')
  gem 'rest-client', '~> 1.6.8'
end
```

* rest-client, json


## Bundler

If you are installing via bundler, you should be sure to use the https
rubygems source in your Gemfile, as any gems fetched over http could potentially be compromised.

```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'synapse_pay'
```


## Development

Test cases can be run with: `bundle exec rake test`

