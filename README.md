# Combination::Extractor

Exctract keyed patterns hash to combination keyed hash.

Convert this hash:

```ruby
{
  fruit: ['apple', 'orange'],
  city: ['NewYork', 'London', 'Tokyo']
}
```

To this:
```ruby
[
  {:fruit=>"apple", :city=>"NewYork"},
  {:fruit=>"apple", :city=>"London"},
  {:fruit=>"apple", :city=>"Tokyo"},
  {:fruit=>"orange", :city=>"NewYork"},
  {:fruit=>"orange", :city=>"London"},
  {:fruit=>"orange", :city=>"Tokyo"}
]
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'combination-extractor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install combination-extractor

## Usage

```ruby
CombinationExtractor.extract({fruit: ['apple', 'orange'], city: ['NewYork', 'London', 'Tokyo']})
=> [{:fruit=>"apple", :city=>"NewYork"}, {:fruit=>"apple", :city=>"London"}, {:fruit=>"apple", :city=>"Tokyo"},
    {:fruit=>"orange", :city=>"NewYork"}, {:fruit=>"orange", :city=>"London"}, {:fruit=>"orange", :city=>"Tokyo"}]
```

### Example for rspec

```ruby
def example_similar_to(user_hash)
  user_hash[:birthday] == Time.new(1988, 12, 30) &&
    user_hash[:gender] == :male
end

describe 'About example example_similar_to method' do

  let(:nickname) { nil }
  let(:gender) { nil }
  let(:birthday) { nil }
  let(:user) { { nickname: nickname, gender: gender, birthday: birthday } }

  user_condition = {
    nickname: ['John', 'Ken', 'Jessie'],
    gender: [:female, :male],
    birthday: [Time.new(1988, 12, 30), Time.now]
  }
  # Get 2*2*3 = 12 patterns
  pattern_list = CombinationExtractor.extract(user_condition)

  pattern_list.each do |pattern|
    describe "user who is #{pattern.to_s}" do
      # NOTE: Set pattern to lazy evaluated variable
      pattern.each { |key, value| let(key) { value } }

      should_value = pattern[:gender] == :male && pattern[:birthday] == Time.new(1988, 12, 30)
      it "should return #{should_value}" do
        expect(example_similar_to(user)).to eq(should_value)
      end
    end
  end
end
```

`bundle exec rspec` returns this:

![sample image](https://i.gyazo.com/4e8feedba872b84ed401645f2820c867.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akiroom/combination-extractor.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

