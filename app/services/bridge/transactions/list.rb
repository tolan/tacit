class Bridge::Transactions::List
  require 'rest-client'

  def self.call(user)

    access_token = Bridge::Users::GetAccessToken.call(user)["access_token"]

    unless Bridge::Users::ValidateEmail.is_needed?(access_token)
      url = "https://sync.bankin.com/v2/transactions"
      params = {
        limit: 500,
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
end
