#!/usr/bin/env ruby

require 'rubygems'
require 'headless'
require 'selenium-webdriver'

p "Spawned headless"
Headless.new(display: 100, destroy_at_exit: false).start

begin
    p "just entered"
    headless = Headless.new display: 100, reuse: true, destroy_at_exit: false
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to 'https://google.com'
    p "retrieved url - #{driver.title}"
    driver.quit
    p "selenium quit, we completed successfully"
ensure
    p "ensure headless is destroyed"
    headless = Headless.new(display: 100, reuse: true)
    headless.destroy    
end

     
