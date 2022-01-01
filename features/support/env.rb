ENV['RACK_ENV'] = 'TEST'

require 'rack/test'
require 'capybara/dsl'
require 'capybara/minitest'
require 'capybara/minitest/spec'
require 'capybara/cucumber'
require 'selenium/webdriver';

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

Capybara.register_driver :headless_firefox do |app|
  opts = Selenium::WebDriver::Firefox::Options.new
  opts.headless!

  Capybara::Selenium::Driver.new(app, browser: :firefox, capabilities: opts)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  opts = Selenium::WebDriver::Chrome::Options.new
  opts.add_argument '--headless'

  # Default window size is only 800x600
  opts.add_argument '--window-size=1920,1080'

  # May be needed for Windows
  # opts.add_argument '--disable-gpu'

  # Needed for docker
  # opts.add_argument '--no-sandbox'

  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: opts)
end

# Capybara.default_driver = :firefox
Capybara.default_driver = :headless_firefox
# Capybara.default_driver = :chrome
# Capybara.default_driver = :headless_chrome
