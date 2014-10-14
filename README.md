# FactoryGroup

[![Gem Version](https://badge.fury.io/rb/factory_group.svg)](http://badge.fury.io/rb/factory_group)
[![Build Status](https://travis-ci.org/Codebrahma/factory_group.svg?branch=master)](https://travis-ci.org/Codebrahma/factory_group)
[![Code Climate](https://codeclimate.com/github/Codebrahma/factory_group/badges/gpa.svg)](https://codeclimate.com/github/Codebrahma/factory_group)
[![Dependency Status](https://gemnasium.com/Codebrahma/factory_group.svg)](https://gemnasium.com/Codebrahma/factory_group)
[![Test Coverage](https://codeclimate.com/github/Codebrahma/factory_group/badges/coverage.svg)](https://codeclimate.com/github/Codebrahma/factory_group)

By [CodeBrahma](http://codebrahma.com).

FactoryGroup provides an abstraction on top of factory_girl, which will help you create reusable groups of factories which can be used across test cases.

For now we support only rails applications.

## Installation

Add this line to your application's Gemfile:

    gem 'factory_group', :group => :test

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factory_group

## Usage

Define a factory group

```ruby
# spec/factory_groups/user_group.rb
FactoryGroup.define :user_group do
  user FactoryGirl.create(:user, :name => "Rajinikant")
end
```

Next require the factory_groups folder from the spec_helper

```ruby
# spec/spec_helper.rb
Dir["spec/factory_groups/**/*.rb"].each { |f| require File.expand_path(f) }
```

Now from your spec call ```FactoryGroup.create(:user_group)```

```ruby
# spec/user_spec.rb
describe User do
  let(:user_group) { FactoryGroup.create(:user_group) }

  context "#name" do
    it "returns Rajinikant" do
      expect(user_group.user.name).to eq "Rajinikant"
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/factory_group/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
