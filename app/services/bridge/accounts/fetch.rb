class Bridge::Accounts::Fetch
  require 'rest-client'

  def self.call(account_id, access_token)
    url = "https://sync.bankin.com/v2/accounts/#{account_id}"

    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    #dnac.dry_refacto w/method
    #RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"] if Rails.env.production?
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15",
      "Authorization": "Bearer #{access_token}"
    })
    JSON.parse(response.body)
  end
end
