# svmlightcli

This is a convenience gem wrapper for the [svm_light](http://svmlight.joachims.org/)
command line binaries. No Ruby interfaces.
After installation, it will offer 2 binaries in the path: svm_learn and svm_classify.
In other words, it is something like:
`brew install svm_light`
Or
`apt-get install svm_light`
(which do not exist), but using the RubyGems way.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'svmlightcli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install svmlightcli

## Usage

Use the binaries the same exact way you use them when compiling from source:

    svm_learn ...

    svm_classify ...

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hammady/svmlightcli.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
The original license of the svm_light author is also maintained in LICENSE.txt.

