# hypothesis two
#
# goto race condition bug was successfully reproduced 
# only on the deployment server. Why is this?
#
# lock goto in mutex should hopefully solve this problem.
# but more importantly what is different between server
# and the rest?

require 'rubygems'
require 'headless'
require 'watir-webdriver'
require 'thread'

ATTEMPTS = 5

def get_google id, semaphore
    p "#{id} creating and starting headless"
    headless = Headless.new display: 100, reuse: true, destroy_at_exit: false
    headless.start

    p "#{id} creating and starting watir"
    b = Watir::Browser.new

    begin
        ATTEMPTS.times do |n|
            p "#{id} retrieving url - attempt #{n}"
            semaphore.synchronize { b.goto 'google.com' } 
            p "#{id} #{b.title}"
        end
    rescue StandardError => e
        raise e
    ensure
        p "#{id} closing watir"
        b.close

        p "#{id} closing headless"
        # headless.destroy

        p "#{id} goodbye"
end

p "launching threads"
semaphore = Mutex.new
threads = Array (1..2)
threads.map! { |id| Thread.new{get_google(id, semaphore)} }
threads.each { |t| t.join }
