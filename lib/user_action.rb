class UserAction
  
  def initialize(browser, timeout)
    @browser = browser
    @timeout = timeout
  end

  def sign_in(email, password)
    begin
      user_email = @timeout.until {
        element = @browser.find_element(:id, "user_email")
        element.send_keys "#{email}" if element.displayed?
      }

      user_password = @timeout.until {
        element = @browser.find_element(:id, "user_password")
        element.send_keys "#{password}" if element.displayed?
        element.submit
      }

      header = @timeout.until {
        element = @browser.find_element(:class, "g5-header")
        element if element.displayed?
      }
      
      puts "Test Passed: Header Loaded" if header.displayed?

      version = @timeout.until {
        element = @browser.find_element(:class, "version")
        element if element.displayed?
      }

      puts "Test Passed: Version Loaded" if version.displayed?

      return true
    rescue
      return false
    end
  end
end