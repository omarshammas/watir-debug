require 'rubygems'
require 'headless'
require 'watir-webdriver'

SLEEP_SECONDS = 5
ATTEMPTS = 5

def get_google id
    display = 100 # + id
    p "#{id} creating and starting headless on display #{display}"
    headless = Headless.new display: display, reuse: true, destroy_at_exit: false
    headless.start

    p "#{id} creating and starting watir"
    b = Watir::Browser.new

    ATTEMPTS.times do |n|
        p "#{id} retrieving url - attempt #{n}"
        b.goto 'google.com' 
        p "#{id} #{b.title}"
    end

    p "#{id} closing watir"
    b.close

    p "#{id} closing headless"
    # headless.destroy

    p "#{id} goodbye"
end

p "launching threads"
threads = Array (1..2)
threads.map! { |id| Thread.new{get_google(id)} }
threads.each { |t| t.join }
