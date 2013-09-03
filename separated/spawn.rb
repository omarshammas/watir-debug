#!/usr/bin/env ruby

require 'rubygems'
require 'headless'

p "Spawned headless"
Headless.new(display: 100, destroy_at_exit: false).start
