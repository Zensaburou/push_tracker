source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
gem 'rails-api'

# Database
gem 'pg'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'
gem 'unicorn-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
  gem 'database_cleaner'
end

group :development, :test do
  gem 'byebug'

  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false

  gem 'guard'
  gem 'guard-rspec'

  # Linter
  gem 'guard-rubocop'

  gem 'factory_girl_rails'

  gem 'faker'
end
