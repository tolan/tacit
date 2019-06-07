class Bridge::Users::Delete
  require 'rest-client'

  def self.call
    url = "https://sync.bankin.com/v2/users"
    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    #RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"] if Rails.env.production?
    response = RestClient.delete(url, {
      params: params,
      "Bankin-Version": "2018-06-15"
    })
  end
end
