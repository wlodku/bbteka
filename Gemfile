source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg', '~> 0.20.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootstrap-sass', '~> 3.3.6'
gem 'react-rails'
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'devise-i18n'
gem 'devise_account_expireable'
gem 'faker', '~> 1.7', '>= 1.7.3'
gem 'haml', '~> 4.0', '>= 4.0.7'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'activeadmin', '~> 1.0.0.pre4'
# Plus integrations with:
gem 'cancan' # or cancancan
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
gem 'draper', github: 'audionerd/draper', branch: 'rails5'
gem 'pundit'

# gem 'searchkick', '~> 2.2'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'will-paginate-i18n', '~> 0.1.15'
gem 'barby', '~> 0.6.5'
gem 'chunky_png', '~> 1.3', '>= 1.3.5'
gem 'prawn', '~> 2.2', '>= 2.2.2'
gem 'prawn-table'
gem 'prawnto', '~> 0.0.1'
gem 'filterrific', '~> 2.1', '>= 2.1.2'
gem 'activerecord-import', '~> 0.18.3'
gem 'nokogiri', '~> 1.6', '>= 1.6.8.1'
gem 'roo', '~> 2.7', '>= 2.7.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
end

group :development do

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # += RailsPanel in Chrome xD
  gem 'meta_request'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
