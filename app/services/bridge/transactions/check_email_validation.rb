class Bridge::Transactions::CheckEmailValidation
  require 'rest-client'
  require 'selenium-webdriver'

  def self.call(user)

    user.create_bridge_user! unless user.has_bridge_account?
    access_token = Bridge::Users::GetAccessToken.call(user)["access_token"]

    puts access_token
    Bridge::Users::ValidateEmail.call(access_token)
    puts "Check your email for a validation code"
    return response_url
    #open external website
  end
end

#   def self.call
#     driver = Selenium::WebDriver.for :chrome
#     driver.navigate.to "https://www.google.com"
#   end
# end
