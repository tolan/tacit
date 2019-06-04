class Bridge::Users::ConnectItem
  require 'rest-client'

  def self.call(access_token)
    url = "https://sync.bankin.com/v2/connect/items/add/url"
    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15",
      "Authorization": "Bearer #{access_token}"
    })
    response.code == 200 ? JSON.parse(response.body)["redirect_url"] : response
  end
end
