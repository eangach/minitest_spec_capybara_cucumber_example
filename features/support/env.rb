ENV['RACK_ENV'] = 'TEST'

require 'rack/test'
require 'capybara/dsl'
require 'capybara/minitest'
require 'capybara/minitest/spec'
require 'capybara/cucumber'

require 'byebug'
require 'pry-byebug'

World(Capybara::Minitest::Assertions)

Before do
  Thread.current[:current_spec] = self
end

require_relative '../../lib/app'
Capybara.app = App


Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :firefox
# Capybara.default_driver = :chrome
