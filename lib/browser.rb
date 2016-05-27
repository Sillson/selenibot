class Browser
  attr_reader :browser, :timeout
  def initialize(browser, timeout)
    @browser = Selenium::WebDriver.for browser.to_sym
    @timeout = Selenium::WebDriver::Wait.new(:timeout => timeout)
  end
end

