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

         @test_variable = 'Rapel: Abonnement Axa Auto'
         @renewal_date = " 2020-06-06"
         @today = Date.today
         @start_time = "8:00pm"
         @end_time = "9:00pm"

      # @test_variable = 'Rapel: Abonnement Axa Auto'
      # @test_variable = 'Tollie Test 123'

      #reminder 1 - today
      service.quick_add_event(
      'primary',
      "#{@test_variable} on #{@today} #{@start_time}-#{@end_time}")

      #reminder 1 - renewal date
      service.quick_add_event(
     'primary',
     "#{@test_variable} on #{@renewal_date} #{@start_time}-#{@end_time}")
  respond_to do |format|
    format.js
  end

 end
end
