#========================================================================
#---------------------tollie_google_docs_github
class Calendar::Calendar

require 'rest-client'

   def self.call()
    # @event = {
    #   'summary' => 'New Event Title',
    #   'description' => 'The description',
    #   'location' => 'Location',
    #   'start' => { 'dateTime' => Chronic.parse('tomorrow 4 pm') },
    #   'end' => { 'dateTime' => Chronic.parse('tomorrow 5pm') },
    #   'attendees' => [ { "email" => 'bob@example.com' },
    #   { "email" =>'sally@example.com' } ] }

    # client = Google::Apis::CalendarV3.insert_event(calendar_id)

    # url = 'https://www.googleapis.com/auth/calendar.events'
    url = 'https://www.googleapis.com/calendar/v3/calendars/calendarId/events/quickAdd'

    response = RestClient.post(url)

    return JSON.parse(response.body)

  end

end








#   def self.call(user)
#     url = "https://sync.bankin.com/v2/users?email=#{user.email}&password=#{ENV["bridge_user_password"]}&client_id=#{ENV["bridge_client_id"]}&client_secret=#{ENV["bridge_client_secret"]}"
#     header = {
#       "Bankin-Version" => "2018-06-15"
#     }
#     RestClient.proxy = ENV["FIXIE_URL"] if Rails.env.production?
#     response = RestClient.post(url, {}, header)
#     uuid = JSON.parse(response.body)["uuid"]
#     # user.uuid = uuid
#     # user.save
#   end



# #========================================================================
# #---------------------landonmarder

# @event = {
#   'summary' => 'New Event Title',
#   'description' => 'The description',
#   'location' => 'Location',
#   'start' => { 'dateTime' => Chronic.parse('tomorrow 4 pm') },
#   'end' => { 'dateTime' => Chronic.parse('tomorrow 5pm') },
#   'attendees' => [ { "email" => 'bob@example.com' },
#   { "email" =>'sally@example.com' } ] }

# client = Google::APIClient.new
# client.authorization.access_token = current_user.token
# service = client.discovered_api('calendar', 'v3')

# @set_event = client.execute(:api_method => service.events.insert,
#                         :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
#                         :body => JSON.dump(@event),
#                         :headers => {'Content-Type' => 'application/json'})


# #========================================================================
# #---------------------Google Official Docs Example

# event = Google::Apis::CalendarV3::Event.new{
#   summary: 'Google I/O 2015',
#   location: '800 Howard St., San Francisco, CA 94103',
#   description: 'A chance to hear more about Google\'s developer products.',
#   start: {
#     date_time: '2015-05-28T09:00:00-07:00',
#     time_zone: 'America/Los_Angeles',
#   },
#   end: {
#     date_time: '2015-05-28T17:00:00-07:00',
#     time_zone: 'America/Los_Angeles',
#   },
#   recurrence: [
#     'RRULE:FREQ=DAILY;COUNT=2'
#   ],
#   attendees: [
#     {email: 'lpage@example.com'},
#     {email: 'sbrin@example.com'},
#   ],
#   reminders: {
#     use_default: false,
#     overrides: [
#       {method' => 'email', 'minutes: 24 * 60},
#       {method' => 'popup', 'minutes: 10},
#     ],
#   },
# }

# result = client.insert_event('primary', event)
# puts "Event created: #{result.html_link}"
