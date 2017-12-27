# MuthofunApi

Welcome to MuthofunApi gem! Muthofun provides sms gateway to send sms.
This rubygem will give you an easy interface to setup your muthofun account. And flexible
way to send sms from your muthofun account!
In order get sms please contact to Muthofun at +8801711272324

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'muthofun_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install muthofun_api

## Usage

##### Configuration:
Steps to configure your `Muthofun` Sms Gateway!

In config/initializers (for Ruby on Rails) file create a muthofun.rb file and configure your
credentials. For other ruby based frameworks or raw ruby project, simply setup the configuration in
any file.

```ruby
MuthofunApi.configuration do |config|
  config.client_id  = 'abcdef'
  config.secret_key = 'helloworld'
  config.originator = '01844016400'
end      
```


## How to send sms
Once you are done with your credential setup you are ready to go
you can send sms using the following command.

```ruby
result = MuthofunApi::SmsAccount.send_sms('8801766678130', 'Hello Bidhu from Irfan')
pp result.output
pp result.success?
pp result.failed?
pp result.error
pp result.error_description
pp result.error_code
```
But if you want to do something when sms is sent successfully you can use a block like the following snippets!

```ruby
a = MuthofunApi::SmsAccount.send_sms('8801766678130', 'Hello Bidhu from Irfan') do |result|
  # Only executes when sending sms is successful!
  pp result.output
  pp result.success?
  pp result.failed?
  pp result.error
  pp result.error_description
  pp result.error_code
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubyrider/muthofun_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MuthofunApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/muthofun_api/blob/master/CODE_OF_CONDUCT.md).
