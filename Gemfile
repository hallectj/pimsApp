source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#default gems
gem 'rails', '~> 5.1.6'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

#my gem includes
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'devise'
gem 'toastr-rails'
gem 'rails-ujs', '~> 0.1.0'
gem 'remotipart', '~> 1.4', '>= 1.4.2'
gem 'rails_admin', '~> 1.4', '>= 1.4.1'
gem 'cancancan'
gem 'load_and_authorize_resource'
gem 'simple_form', '~> 4.0', '>= 4.0.1'
gem 'rails-observers'

gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap-datepicker-rails'
gem 'whenever'

#to make console pretty for development purposes and readibility
gem 'hirb', '~> 0.7.3'
gem 'activerecord-reset-pk-sequence'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

#gems needed for when developing on windows machine do not delete
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
