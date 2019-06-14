class ServicesController < ApplicationController
  def connect_item
    redirect_to Bridge::Items::Connect.call(current_user)
  end

  def convert_transactions
    # pull transactions from Bridge
    transactions = SaveInDb::Transactions.call(current_user)

    # assign subscriptions to
    Converttransaction.call(transactions)
  end

   def google_calendar_item()
    #check for authentication
      #no authentication -- poour
        #missing actions

      #with exisiting authentication, have item that you can then manipulate

      #get form, for variables {opeartion.name, date, start_time, end_time}
    service = GoogleCalendar.new.call
       date = "June 6th, 2020"
       start_time = "12:00pm"
       end_time = "1:00pm"


    # test_variable = 'Rapel: Abonnement Axa Auto'
    test_variable = 'This is a another test -- Axa Auto'

    #reminder 1 - today
    service.quick_add_event(
    'primary',
    "#{test_variable} on #{Date.today + 1.day} #{start_time}-#{end_time}")


    service.quick_add_event(
   'primary',
   "#{test_variable} on June 6th 2020 #{start_time}-#{end_time}")

  #test mannual
#
#  result = service.quick_add_event(
#  'primary',
#  'Late Night Test -- on June 14th 9:00am-10:00am')
#
#  result2 = service.quick_add_event(
#    'primary',
#    'Late Night Test -- on June 6th 2020 9:00am-10:00am')
#  print result.id
  respond_to do |format|
    format.js
  end

 end
end
