class Subscription < ApplicationRecord
  belongs_to :operator
  has_many :operations

  def new_sub?

  end

  def trend

  end

  def avg_fee

  end

  def payment_frequency

  end

  def time_before_next_payment

  end
end
