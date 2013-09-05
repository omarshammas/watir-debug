# hypothesis one
#
# attempting to reproduce a bug in watir when
# multiple threads are invoking the goto method
# on a Watir::Browser instance

require 'rubygems'
require 'headless'
require 'watir-webdriver'

ATTEMPTS = 10

def get_google id
    p "#{id} creating and starting headless"
    headless = Headless.new display: 100 , reuse: true, destroy_at_exit: false
    headless.start

    p "#{id} creating and starting watir"
    b = Watir::Browser.new

    begin
        ATTEMPTS.times do |n|
            p "#{id} retrieving url - attempt #{n}"
            b.goto 'google.com' 
            p "#{id} #{b.title}"
        end
   rescue StandardError => e
        raise
    ensure
        p "#{id} closing watir"
        b.close rescue p "#{id} *** unable to close watir ***"

        p "#{id} closing headless"
        # headless.destroy

        p "#{id} goodbye"
    end
end

p "launching threads"
threads = Array (1..2)
threads.map! { |id| Thread.new{get_google(id)} }
threads.each { |t| t.join }
