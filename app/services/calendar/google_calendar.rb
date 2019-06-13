class Calendar::GoogleCalendar
  def self.call(user)
    event = {
      summary: 'Google I/O 2015',
      location: '800 Howard St., San Francisco, CA 94103',
      description: 'A chance to hear more about Google\'s developer products.',
      'start' => { 'dateTime' => Time.now + 1.day },
      'end' => { 'dateTime' => Time.now + 1.day + 1.hour },
      attendees: [
        {email: 'lpage@example.com'},
        {email: 'sbrin@example.com'},
      ],
      reminders: {
        use_default: false,
        overrides: [
          {'method' => 'email', 'minutes': 24 * 60} ,
          {'method' => 'popup', 'minutes': 10},
        ],
      },
    }

    # client = Google::APIClient.new(:application_name => 'Zapitfr', :application_version => '1.0')
    client = Google::Apis::CalendarV3::Event.new(:application_name => 'Zapitfr', :application_version => '1.0')
    # client.authorization.access_token = user.token
    # service = client.discovered_api('calendar', 'v3')

    # client.execute(:api_method => service.events.insert,
    #                     # :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
    #                     :parameters => {'calendarId' => 'user.email', 'sendNotifications' => true},
    #                     :body => JSON.dump(event),
    #                     :headers => {'Content-Type' => 'application/json'})

    result = client.insert_event('primary', event)
    puts "Event created: #{result.html_link}"
  end
end


