class Bridge::Accounts::List
  require 'rest-client'

  def self.call(access_token)
    url = "https://sync.bankin.com/v2/accounts"
    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15",
      "Authorization": "Bearer #{access_token}"
    })
    JSON.parse(response.body)["resources"]
  end
end
