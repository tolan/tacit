class Bridge::Users::List
  require 'rest-client'

  def self.call
    url = "https://sync.bankin.com/v2/users"
    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15"
    })
    JSON.parse(response.body)["resources"]
  end
end
