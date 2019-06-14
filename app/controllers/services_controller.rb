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

   def google_calendar_item
    service = GoogleCalendar.new.call
         @renewal_date = " 2020-06-06"
         @today = Date.today
         @start_time = "12:00pm"
         @end_time = "1:00pm"

      test_variable = 'Rapel: Abonnement Axa Auto'
      # @test_variable = 'Tollie test -- Axa Auto'

      #reminder 1 - today
      service.quick_add_event(
      'primary',
      "#{@test_variable} on #{@today} #{@start_time}-#{@end_time}")

      service.quick_add_event(
     'primary',
     "#{@test_variable} on #{@renewal_date} #{@start_time}-#{@end_time}")
  respond_to do |format|
    format.js
  end

 end
end
