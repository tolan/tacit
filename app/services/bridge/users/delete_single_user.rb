# class Bridge::Users::DeleteSingleUser
#     require 'rest-client'

#   def self.call(uuid)
#     url = "https://sync.bankin.com/v2/users/#{uuid}"
#     params = {
#       password: ENV["bridge_user_password"],
#       client_id: ENV["bridge_client_id"],
#       client_secret: ENV["bridge_client_secret"]
#     }
      ##RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"] if Rails.env.production?
#     response = RestClient.delete(url, {
#       params: params,
#       "Bankin-Version": "2018-06-15"
#     })
#   end
# end
