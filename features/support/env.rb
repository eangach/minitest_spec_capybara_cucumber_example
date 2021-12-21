ENV['RACK_ENV'] = 'TEST'

require 'rack/test'
require 'capybara/dsl'
require 'capybara/minitest'
require 'capybara/minitest/spec'
require 'capybara/cucumber'

World(Capybara::Minitest::Assertions)

Before do
  Thread.current[:current_spec] = self
end

require_relative '../../lib/app'
Capybara.app = App
