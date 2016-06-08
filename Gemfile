source 'https://rubygems.org'

# default gems
gem 'rails', '4.2.6'
gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'unicorn'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-4-x' # For 4.x

# for environment config
gem 'dotenv-rails'

# for bootstrap
gem 'bootstrap-sass'

# for login
gem 'sorcery'

# for image
gem 'carrierwave'
gem 'mini_magick'

# for google map api
gem 'gcalapi'

# for back ground job
gem 'delayed_job_active_record'
gem 'daemons'

# for paging
gem 'kaminari'
gem 'kaminari-bootstrap'

# for search
gem 'ransack'

# for aouth
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

# for share
gem 'social-share-button'

group :development do
  gem 'better_errors'
  #gem 'binding_of_caller'
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
end

group :development, :test, :staging do
  gem 'factory_girl_rails', require: false
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
  gem 'capybara'
end
