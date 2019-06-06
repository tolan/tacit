module CardsHelpers
  def trend?(the_subscription)
    true
    # return true if there is a trend
  end

  def up_or_down(the_subscription)
    the_subscription
    up
    # return true if the last transaction was
  end

  # return the average (string) fee of transactions
  def avg_amount(the_subscription)
    if the_subscription.operations.count == 1
      the_subscription.operations.last.amount.to_s
    else
      "~#{the_subscription.operations.average(:amount)}"
    end
end
