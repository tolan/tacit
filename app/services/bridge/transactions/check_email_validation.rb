class Bridge::Transactions::CheckEmailValidation
  require 'rest-client'

  def self.call(user)

    access_token = Bridge::Users::GetAccessToken.call(user)["access_token"]

    Bridge::Users::ValidateEmail.call(access_token)
    puts "Check your email for a validation code"
    #open external website
  end
end
