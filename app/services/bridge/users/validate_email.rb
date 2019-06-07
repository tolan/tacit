class Bridge::Users::ValidateEmail
  def self.call(access_token)
    if self.is_needed?(access_token)
      url = "https://sync.bankin.com/v2/connect/users/email/confirmation/url"
      #TA added response_url
      # response_url = ''
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
      #TA assistance on how to assign variable
      # response_url = JSON.parse(response.body)["redirect_url"]
      # response.code == 200 ? response_url : response
    else
      nil
    end
  end

  def self.is_needed?(access_token)
    url = "https://sync.bankin.com/v2/users/me/email/confirmation"
    params = {
      client_id: ENV["bridge_client_id"],
      client_secret: ENV["bridge_client_secret"]
    }
    response = RestClient.get(url, {
      params: params,
      "Bankin-Version": "2018-06-15",
      "Authorization": "Bearer #{access_token}"
    })
    !JSON.parse(response.body)["is_confirmed"]
  end
end
