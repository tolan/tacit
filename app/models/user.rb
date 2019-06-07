class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :operations
  has_many :subscriptions, through: :operations, source: :subscription # allow to find the column operations
  has_many :operators, through: :subscriptions
  has_many :accounts
  has_many :banks, through: :accounts

  def has_bridge_account?
    self.uuid.present?
  end

  def create_bridge_user!
    #check with TA arpimd
    self.uuid = Bridge::Users::Create.call(self)
    ##logic if already exists?
    self.save
  end

  def spent_between_two_date(date1, date2)
    operations.select do |operation|
      operation.date < date2 && operation.date > date1 # filter operations within two date
    end.map do |operation|                             # operation to operation.amount (float)
      operation.amount
    end.inject(0) { |sum, x| sum + x }                 # sum the elements of the array (float)
  end

  def last_month_spent
    spent_between_two_date(Time.now - 30.days, Time.now)
  end

  def last_month_var
    spent_between_two_date(Time.now - 30.days, Time.now) - spent_between_two_date(Time.now - 60.days, Time.now - 30.days)
  end

  def last_month_trend
    if last_month_var > 0
      "arrow_up"
    else
      "arrow_down"
    end
  end
end

