# Reproducing Headless Bug

Reproducing an unable to obtain stable firefox connection bug. 

```
/home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver/firefox/launcher.rb:79:in `connect_until_stable': unable to obtain stable firefox connection in 60 seconds (127.0.0.1:7055) (Selenium::WebDriver::Error::WebDriverError)
    from /home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver/firefox/launcher.rb:37:in `block in launch'
    from /home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver/firefox/socket_lock.rb:20:in `locked'
    from /home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver/firefox/launcher.rb:32:in `launch'
    from /home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver/firefox/bridge.rb:24:in `initialize'
    from /home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver/common/driver.rb:31:in `new'
    from /home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver/common/driver.rb:31:in `for'
    from /home/deployer/apps/mylife/shared/bundle/ruby/1.9.1/gems/selenium-webdriver-2.35.0/lib/selenium/webdriver.rb:67:in `for'
    from safe.rb:11:in `safe'
    from safe.rb:20:in `block in <main>'
```

After looking at ```debug.txt``` it appears to be an ```Error: no display specified```.


## Separated

You can launch the entire simulation ine one shot with ```ruby separated/launch.rb``` or piece by piece. First we spawn a Headless instance with ```spawn.rb```, we then reuse the same instance in ```safe.rb```, and lastly we clean up with ```reap.rb```.

To collect all the errors run the script in debug mode and pipe stderr and stdout to debug.txt ```ruby -d safe.rb >> debug.txt 2>&1 ```. Note you must run ```spawn.rb``` first.

## Joined

Included is a single ruby script which combines all spawn.rb, safe.rb and reap.rb into one ```ruby joined/safe.rb```. In this scenario the script successfully without any errors.
