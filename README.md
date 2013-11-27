# TrackingNumberValidator

Validator for DHL and FedEx Ground tracking numbers.

Currently supported services: DHL and Fed Ex Ground

Fed Ex Ground validator supports only the latest format

More info: http://fedex.p.delivery.net/m/p/fdx/bcc/home.asp

## Installation

Add this line to your application's Gemfile:

    gem 'tracking_number_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tracking_number_validator

## Usage

```ruby
require 'tracking_number_validator'

validator = TrackingNumberValidator::DHLValidator.new("foo")
validator.valid? # => false

validator = TrackingNumberValidator::FedExGroundValidator.new("foo")
validator.valid? # => false

TrackingNumberValidator::Service.detect("2111111111") # => :dhl
TrackingNumberValidator::Service.detect("9622001900005009141100548983268777") # => :fed_ex_ground
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
