class Bridge::Users::GetItemRefreshStatus
  require 'rest-client'

  def self.call(item_id, access_token)
    url = "https://sync.bankin.com/v2/items/#{item_id}/refresh/status"
    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15",
      "Authorization": "Bearer #{access_token}"
    })
    JSON.parse(response.body)
  end
end
