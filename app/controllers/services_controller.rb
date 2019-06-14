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
       start_time = "9:00am"
       end_time = "10:00am"


    test_variable = 'Rapel: Abonnement Axa Auto'

    #reminder 1 - today
    result = service.quick_add_event(
    'primary',
    "#{test_variable} on #{Date.today} #{start_time}-#{end_time}")



#reminder 2
     result = service.quick_add_event(
   'primary',
   "#{test_variable} on #{date} #{start_time}-#{end_time}")

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
 end
end
