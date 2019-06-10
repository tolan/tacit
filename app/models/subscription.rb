include ActionView::Helpers::DateHelper

class Subscription < ApplicationRecord
  belongs_to :operator
  has_many :operations

  def new_sub?
    operations.count == 1
  end

  def avg_fee
    operations.average(:amount) # float
  end

  # give infos relative to subscription fees variation

  def trend
    if new_sub?
      "none"
    elsif avg_fee == operations.last.amount
      "flat_fee"
    elsif operations.last.amount > operations[-2].amount
      "arrow_up"
    else
      "arrow_down"
    end
  end

  # give payment frequency in string type and integer days

  def payment_frequency
    unless new_sub?
      diff_date = (operations[-2].date - operations.last.date)
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
