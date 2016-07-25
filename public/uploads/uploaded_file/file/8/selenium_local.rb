require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://google.com"

element = driver.find_element(:name, 'q')
element.send_keys "Browserstack"
element.submit
sleep 5
driver.quit

