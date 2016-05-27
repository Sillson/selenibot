class TestPlan
 
  def initialize(browser, timeout, cms, email, password)
    @selenium = Browser.new(browser, timeout.to_i)
    @browser = @selenium.browser
    @timeout = @selenium.timeout
    @cms = cms
    @email = email
    @password = password
  end

  def load_cms
    @browser.get("https://#{@cms}.herokuapp.com/")
    user_action = UserAction.new(@browser, @timeout)
    user_action.sign_in(@email, @password)
  end
end