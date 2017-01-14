source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# To anotate all the model files for better readablity
gem 'annotate'
  # For generating fake data
  gem 'faker'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  #For unit testing
  gem 'rspec-rails'

  #For mock data
  # To stop asset pipelining log messages
  gem 'quiet_assets'
  #For rspec
  gem 'rspec-collection_matchers'
end

group :production do 
  # for heroku
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'sqlite3'
  gem 'spring'
  gem 'pry'
end