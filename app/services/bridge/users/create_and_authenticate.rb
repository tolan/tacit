# class Bridge::Users::CreateAndAuthenticate
#   require 'rest-client'
#   def self.call(email, password)
#     create_user = Bankin::Users::Create.call(email, password)
#     if create_user.code == 201
#       auth_user = Bankin::Users::Authenticate.call(email, password)
#     else
#       JSON.parse(create_user.body)
#     end
#   end
# end
