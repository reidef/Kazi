source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', :group => [:test, :development]
group :production do
  gem 'pg'
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'simple_form'
gem 'cancan'
gem 'ancestry'

gem "rspec-rails", :group => [:test, :development]

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'mocha'
end