class Bridge::Accounts::SingleAccount
  require 'rest-client'

  def self.call(account_id, access_token)
    # account_id = ???
    url = "https://sync.bankin.com/v2/accounts/#{account_id}?client_id=#{ENV["bridge_client_id"]}&client_secret=#{ENV["bridge_client_secret"]}"
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

