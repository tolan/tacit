class Bridge::Categories::List
  require 'rest-client'

  def self.call
    url = "https://sync.bankin.com/v2/categories?limit=500"
    params = {
      limit: 500,
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"] if Rails.env.production?
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15",
      "Accept-Language": "FR"
    })
    JSON.parse(response.body)["resources"]
  end
end
