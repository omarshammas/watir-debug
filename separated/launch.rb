#!/usr/bin/env ruby

require 'rubygems'

%w[spawn.rb safe.rb reap.rb].each do |filename|
    p "--- Executing #{filename} ---"
    pipe = IO.popen "bundle exec ruby #{filename}"
    while (line = pipe.gets) 
        print line 
    end
end

