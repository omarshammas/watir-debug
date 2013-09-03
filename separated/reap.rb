#!/usr/bin/env ruby

require 'rubygems'
require 'headless'

p "ensure headless is destroyed"
headless = Headless.new(display: 100, reuse: true)
headless.destroy    
