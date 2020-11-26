# Squisher >>> Sqishr
### create squished, readable strings

Squisher attempts to remove as many letters as it can while keeping your text readable.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'squisher'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install squisher

## Usage

Squisher by default squishes as much as it can with a word length minimum of 3 characters.

```ruby
Squisher.squish('squish the text to death')
# => "sqsh the txt to dth"
```

Shisher allows you to pass options for:
- word_min: the minimum required length for each word; default is 3
- total_max: the maximum desired length of the entire string; default is 0
  - this option is not a hard limit and word_min has higher priority
- delimiter: the delimiter used to split inputted text into words; default /\s+/
- join_by: the character to join the words 

## TODO

- make the delimiter capture the split and rejoin based on what is captured
- implement a hard limit option that overrides the word_min

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dysomni/squisher.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
