include ActionView::Helpers::DateHelper

class Subscription < ApplicationRecord
  belongs_to :operator
  has_many :operations
  has_one :user , through: :operations, source: :user

  def new_sub?
    operations.count == 1
  end

  def avg_fee
    operations.where("amount_cents < 0").average(:amount_cents) # float
    # curr_format(10000)
  end

  def total_spent
    operations.map do |operation|                             # operation to operation.amount (float)
      operation.amount
    end.inject(0) { |sum, x| sum + x }.abs
  end

  def spent_between_two_date(date1, date2)
    operations.select do |operation|
      operation.date < date2 && operation.date > date1 # filter operations within two date
    end.map do |operation|                             # operation to operation.amount (float)
      operation.amount
    end.inject(0) { |sum, x| sum + x }.abs                 # sum the elements of the array (float)
  end

  def last_month_spent
    start_date = Date.today.at_beginning_of_month - 1.month
    end_date = Date.today.at_end_of_month - 1.month
    spent_between_two_date(start_date, end_date)
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

  def sort_operations_desc
    operations.where("amount_cents < 0").order(date: :desc)
  end

  def payment_frequency
    unless new_sub?
    withdrawls = sort_operations_desc
    diff_date = (withdrawls.first.date - withdrawls[1].date)
    end
    # raise
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
    withdrawls = sort_operations_desc
    # next_payment_date = operations.last.date + delay.days
    next_payment_date = withdrawls.first.date + delay.days
    distance_of_time_in_words(Date.today, next_payment_date)
  end

  # def sock_renewal_date_in_date_base
  #   date = operations.order(date: :desc).first.date + 1.year
  #   self.anniversary_date = date
  #   self.save!
  #   return date
  # end

  def renewal_date
    operations.order(date: :desc).first.date + 1.yearß
  end
end

