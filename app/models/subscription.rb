include ActionView::Helpers::DateHelper

class Subscription < ApplicationRecord
  belongs_to :operator
  has_many :operations

  def new_sub?
    operations.count == 1
  end

  def avg_fee
    operations.where("amount_cents < 0").average(:amount_cents) # float
  end

  def total_spent
    operations.map do |operation|                             # operation to operation.amount (float)
      operation.amount
    end.inject(0) { |sum, x| sum + x }.abs
  end

  # give infos relative to subscription fees variation

  def trend
    if new_sub?
      "none"
    elsif avg_fee == operations.last.amount_cents
      "flat_fee"
    elsif operations.last.amount_cents > operations[-2].amount_cents
      "arrow_up"
    else
      "arrow_down"
    end
  end

  # give payment frequency in string type and integer days

  def payment_frequency
    unless new_sub?
      withdrawls = operations.where("amount_cents < 0").order(date: :desc)
      diff_date = (withdrawls.first.date - withdrawls[1].date)
    end
    if new_sub?
      { type: "nouvel abonnement", days: 0  }
    elsif diff_date.between?(5, 15)
      { type: "hebdomadaire", days: 7 }
    elsif diff_date.between?(15, 45)
      { type: "mensuel", days: 30 }
    elsif diff_date.between?(45, 150)
      { type: "trimestriel", days: 90 }
    elsif diff_date.between?(150, 200)
      { type: "semestriel", days: 180 }
    else
      { type: "annuel", days: 365 }
    end
  end

 # give an estimated period before next payment

  def time_before_next_payment
    delay = payment_frequency[:days]
    next_payment_date = operations.last.date + delay.days
    distance_of_time_in_words(Date.today, next_payment_date)
  end
end
