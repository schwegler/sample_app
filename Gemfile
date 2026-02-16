source 'https://rubygems.org'
ruby '3.2.3'

gem 'rails', '~> 7.1.3'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Use other typical Rails 7 gems
gem 'sprockets-rails'
gem 'jbuilder'

# Restore legacy assets support
gem 'jquery-rails'
gem 'turbolinks'

# Constrain dependencies to avoid compilation issues with native extensions
gem 'irb', '1.6.2'
gem 'rdoc', '>= 6.5.1.1'
gem 'psych', '5.0.1'

gem 'bootstrap', '~> 5.3'
gem 'popper_js'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.7'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0'
  gem 'bundler-audit'
  gem 'brakeman'
  gem 'rubocop'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
end

gem "bcrypt", "~> 3.1"

gem "image_processing", "~> 1.2"
