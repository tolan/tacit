class Calendar::GoogleCalendar

  def self.call(user)
    event = {
      'summary' => 'New Event Title',
      'description' => 'The description',
      'location' => 'Location',
      'start' => { 'dateTime' => Time.now + 1.day },
      'end' => { 'dateTime' => Time.now + 1.day + 1.hour },
      'attendees' => [ { "email" => 'tolanthornton@gmail.com' },
      { "email" =>'tolantask@gmail.com' } ] }

    client = Google::APIClient.new
    client.authorization.access_token = user.token
    service = client.discovered_api('calendar', 'v3')

    # client.execute(:api_method => service.events.insert,
    #                     # :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
    #                     :parameters => {'calendarId' => 'user.email', 'sendNotifications' => true},
    #                     :body => JSON.dump(event),
    #                     :headers => {'Content-Type' => 'application/json'})


new_event = cal.events.insert.request_schema.new
new_event.start = { 'date' => Time.now + 1.day  } #All day event
new_event.end = { 'date' => Time.now + 1.day + 1.hour }
new_event.description = "Description here"
new_event.summary = "Summary here"
result = api_client.execute(:api_method => cal.events.insert,
    :authorization => auth_client,
    :parameters => { 'calendarId' => 'primary'},
    :headers => {'Content-Type' => 'application/json'},
    :body_object => new_event)

  end

end
