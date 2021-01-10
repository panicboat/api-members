source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails'

#--------------------------------------------------
# depencies
#--------------------------------------------------
group :development do
  gem 'debase'
  gem 'rails-erd'
  gem 'ruby-debug-ide'
  gem 'solargraph'
  gem 'trailblazer-developer'
end

group :test do
  gem 'codecov'
  gem 'dotenv-rails'
  gem 'simplecov'
  gem 'trailblazer-test'
  gem 'webmock'
end

group :production do
  gem 'aws-xray-sdk', require: ['aws-xray-sdk/facets/rails/railtie']
  gem 'jrjackson', platform: :jruby # https://github.com/aws/aws-xray-sdk-ruby#installing
  gem 'oj', platform: :mri # https://github.com/aws/aws-xray-sdk-ruby#installing
end

# gem 'panicboat', path: '/app/engine'
gem 'panicboat', git: 'https://github.com/panicboat/api-engine'
gem 'faraday'
gem 'multi_json' # https://github.com/trailblazer/representable#dependencies
gem 'reform-rails'
gem 'trailblazer-rails'
