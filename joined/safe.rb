#!/usr/bin/env ruby

require 'rubygems'
require 'headless'
require 'selenium-webdriver'

def safe 
    p "just entered"
    headless = Headless.new display: 100, reuse: true, destroy_at_exit: false
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to 'https://google.com'
    p "retrieved url - #{driver.title}"
    driver.quit
end

p "Spawned headless"
Headless.new(display: 100, destroy_at_exit: false).start

begin
    p "launching threads"
    t1=Thread.new{ safe() } 
    t1.join
ensure
    p "ensure headless is destroyed"
    headless = Headless.new(display: 100, reuse: true)
    headless.destroy    
end

     
