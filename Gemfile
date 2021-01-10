source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

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
