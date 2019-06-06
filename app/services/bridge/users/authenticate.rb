class Bridge::Users::Authenticate
  require 'rest-client'

  def self.call(email, password)
    url = "https://sync.bankin.com/v2/authenticate?email=#{email}&password=#{password}&client_id=#{ENV["bridge_client_id"]}&client_secret=#{ENV["bridge_client_secret"]}"
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
    JSON.parse(response.body)
  end
end

