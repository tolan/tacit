class Bridge::Users::GetAccessToken
  require 'rest-client'

  def self.call(user) # user is User instance from DB
    url = "https://sync.bankin.com/v2/authenticate?email=#{user.email}&password=#{ENV["bridge_user_password"]}&client_id=#{ENV["bridge_client_id"]}&client_secret=#{ENV["bridge_client_secret"]}"
    header = {
      "Bankin-Version" => "2018-06-15"
    }
    #RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"] if Rails.env.production?
    response = RestClient.post(url, {}, header)
    # JSON.parse(response.body)["access_token"]
    JSON.parse(response.body)
  end
end

