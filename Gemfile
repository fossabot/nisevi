source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Pg -> Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]
gem 'pg', '~> 0.18.4'
# AWS SDK for Ruby
gem 'aws-sdk', '~> 2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# A lightweight Sass tool set
gem 'bourbon'
# A lightweight, semantic grid framework built with Bourbon
gem 'neat'
# Define a basic set of Sass variables
gem 'bitters'
# Prepackaged patterns and components built with Bourbon, Neat and Bitters.
gem 'refills'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Call JavaScript code and manipulate JavaScript objects from Ruby.
gem 'therubyracer', '~> 0.12.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Templating engine for HTML.
gem 'haml', '~> 4.0', '>= 4.0.7'
#  Interface between Ruby and ImageMagick image processing library.
gem 'rmagick'

# Use threadsafe version of ActiveResource.
gem 'activeresource', github: 'shopify/activeresource', tag: '4.2-threadsafe'

# Background processing for Ruby.
gem 'sidekiq', '~> 4.1'

### Authentication gems ###
# Generic OAuth2 strategy for OmniAuth.
gem 'omniauth-oauth2', '~> 1.3.1'

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise'

# Strategy to authenticate with Google via OAuth2 in OmniAuth.
# gem "omniauth-google-oauth2"

# Official OmniAuth strategy for GitHub.
gem 'omniauth-github'

# Facebook OAuth2 Strategy for OmniAuth
# gem 'omniauth-facebook'

# A LinkedIn OAuth2 strategy for OmniAuth.
gem 'omniauth-linkedin-oauth2'

# Pundit provides a set of helpers which guide you in leveraging regular Ruby
# classes and object oriented design patterns to build a simple, robust and
# scaleable authorization system.
gem 'pundit'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug'
  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails'
  # Testing framework
  gem 'rspec-rails', '~> 3.0'
  # Fixtures replacement with a straightforward definition syntax
  gem 'factory_girl_rails'
  # This gem is a port of Perl's Data::Faker library that generates fake data.
  gem 'faker', '~> 1.6', '>= 1.6.3'
end

group :development do
  # Access an IRB console on exception pages or by using <%=console%> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
