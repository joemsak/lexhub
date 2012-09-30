# Lexhub

Find out your most commonly used words in commits, I guess.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lexhub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lexhub

## Usage

You will need a Github Application registered with an auth token.

TODO: This step might go away...

```
export GITHUB_AUTH_TOKEN=abc123...
```

```ruby
repo = Lexhub::Repo.new('github_username', 'repo_name')

repo.commits #=> same as using github api gem, .repos.commits.all
repo.words   #=> all words from all commit messages

```

TODO: More to come...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
