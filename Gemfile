source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'awesome_print'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'cancancan'
gem 'coffee-rails', '~> 4.2'
gem 'decent_exposure'
gem 'delayed_paperclip'
gem 'devise'
gem 'dotenv-rails'
gem 'draper'
gem 'font-awesome-rails'
gem 'haml-rails'
gem 'icheck-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'paper_trail'
gem 'paperclip'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rollbar'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-scm-gitcopy'
  gem 'capistrano-sidekiq'

  gem 'pry-byebug'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'selenium-webdriver'
end

group :test do
  gem(
    'shoulda-matchers'
  )
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
