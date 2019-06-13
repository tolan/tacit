class ServicesController < ApplicationController

  #brige api items

  def connect_item
    redirect_to Bridge::Items::Connect.call(current_user)
  end

  def convert_transactions
    # pull transactions from Bridge
    transactions = SaveInDb::Transactions.call(current_user)

    # assign subscriptions to
    Converttransaction.call(transactions)
  end

  #google calendar items

  def google_calendar_item()
    #check for authentication
      #no authentication -- poour
        #missing actions

      #with exisiting authentication, have item that you can then manipulate

      #get form, for variables {opeartion.name, date, start_time, end_time}
    service = GoogleCalendar.new.call
  #     date = "June 6th, 2020"
  #     start_time = "12:30pm"
  #     end_time = "1:00pm"


  #   test_variable = 'Abonnement: Axa Auto'

  #   result = service.quick_add_event(
  # 'primary',
  # "#{test_variable} on #{date} #{start_time}-#{end_time}")

  #test mannual

  result = service.quick_add_event(
  'primary',
  'Another Test -- on June 13th 8:30pm-11:30pm')
  print result.id
  end
end
