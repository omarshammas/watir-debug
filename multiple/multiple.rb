require 'rubygems'
require 'headless'
require 'watir-webdriver'

SLEEP_SECONDS = 5

def get_google id
    display = 100 + id
    p "#{id} creating and starting headless on display #{display}"
    headless = Headless.new display: display, reuse: true, destroy_at_exit: false
#    headless.start

    p "#{id} creating and starting watir"
    b = Watir::Browser.new

    seconds = SLEEP_SECONDS
    p "#{id} sleeping for #{seconds}"
    sleep seconds

    p "#{id} retrieve url"
    b.goto 'https://google.com' if id == 1
    b.goto 'https://bing.com' if id == 2
    p "#{id} #{b.title}"

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
