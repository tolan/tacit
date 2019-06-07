class Bridge::Users::Create
  require 'rest-client'

  def self.call(user)
    url = "https://sync.bankin.com/v2/users?email=#{user.email}&password=#{ENV["bridge_user_password"]}&client_id=#{ENV["bridge_client_id"]}&client_secret=#{ENV["bridge_client_secret"]}"
    header = {
      "Bankin-Version" => "2018-06-15"
    }
    RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"] if Rails.env.production?
    response = RestClient.post(url, {}, header)
    uuid = JSON.parse(response.body)["uuid"]
    # user.uuid = uuid
    # user.save
  end
end
