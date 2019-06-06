class Subscription < ApplicationRecord
  belongs_to :operator
  has_many :operations

  def new_sub?
    operations.count == 1
  end

  def avg_fee
    operations.average(:amount)
  end


  # give infos relative to subscription fees variation
  def trend
    if new_sub?
      "none"
    elsif avg_fee == operations.last.amount
      "flat fee"
    elsif operations.last.amount > operations[-2].amount
      "up"
    else
      "down"
    end
  end

  def payment_frequency

  end

  def time_before_next_payment

  end
end
