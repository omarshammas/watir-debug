#!/esr/bin/env ruby

require 'rubygems'
require 'headless'
require 'selenium-webdriver'

p "just entered"
headless = Headless.new display: 100, reuse: true, destroy_at_exit: false
headless.start
driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://google.com"
p "retrieved url  - #{driver.title}"
driver.quit
