class Bridge::Items::Connect
  require 'rest-client'

  def self.call(user)
    access_token = access_token = Bridge::Users::GetAccessToken.call(user)["access_token"]
    url = "https://sync.bankin.com/v2/connect/items/add/url"
    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    RestClient.proxy = ENV["FIXIE_URL"] if Rails.env.production?
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15",
      "Authorization": "Bearer #{access_token}"
    })
    action_redirect_url = JSON.parse(response.body)["redirect_url"]
    response.code == 200 ? action_redirect_url : response
  end
end
