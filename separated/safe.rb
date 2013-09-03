#!/esr/bin/env ruby

require 'rubygems'
require 'headless'
require 'selenium-webdriver'

def safe
	p "just entered"
	headless = Headless.new display: 100, reuse: true, destroy_at_exit: false
	driver = Selenium::WebDriver.for :firefox
	driver.navigate.to "https://google.com"
	p "retrieved url  - #{driver.title}"
	driver.quit
end

p "launching thread"
t1=Thread.new{ safe() } 
t1.join
