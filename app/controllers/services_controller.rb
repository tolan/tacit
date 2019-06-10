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
end
