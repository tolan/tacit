class Calendar::GoogleGoogle

APPLICATION_NAME = "Zapit"
SCOPE = "https://www.googleapis.com/auth/calendar.events"

  def self.call()
    require 'google/api_client'
    require 'google/api_client/client_secrets'
    require 'google/api_client/auth/installed_app'
    require 'google/api_client/auth/storage'
    require 'google/api_client/auth/storages/file_store'
    require 'fileutils'



    ##f
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or intitiating an OAuth2 authorization request via InstalledAppFlow.
    # If authorization is required, the user's default browser will be launched
    # to approve the request.
    #
    # @return [Signet::OAuth2::Client] OAuth2 credentials

    client = Google::APIClient.new(application_name: APPLICATION_NAME)
    calendar_api = client.discovered_api('calendar', 'v3')
    client.authorization = authorize

    # Fetch the next 10 events for the user
    results = client.execute!(
      api_method:  calendar_api.events.quick_add,
      parameters:  {
        calendarId: "primary",
        text:       quick_add
      }
    )

    puts "Added!"
  end

end
