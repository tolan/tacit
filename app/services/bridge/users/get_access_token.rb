class Bridge::Users::GetAccessToken
  require 'rest-client'

  def self.call(user) # user is User instance from DB
    url = "https://sync.bankin.com/v2/authenticate?email=#{user.email}&password=#{ENV["password"]}&client_id=#{ENV["bridge_client_id"]}&client_secret=#{ENV["bridge_client_secret"]}"
    puts url
    # params = {
    #   email: email,
    #   password: password,
    #   client_id: ENV["bridge_client_id"],
    #   client_secret: ENV["bridge_client_secret"]
    # }
    header = {
      "Bankin-Version" => "2018-06-15"
    }
    response = RestClient.post(url, {}, header)
    JSON.parse(response.body)["access_token"]
  end
end

