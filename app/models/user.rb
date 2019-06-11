class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :operations
  has_many :subscriptions, through: :operations, source: :subscription# allow to find the column operations
  has_many :operators, through: :subscriptions
  has_many :accounts
  has_many :banks, through: :accounts
  mount_uploader :photo, PhotoUploader


  def has_bridge_account?
    self.uuid.present?
  end

  def uniq_subscriptions
    subscriptions.uniq
  end

  def create_bridge_user!
    #check with TA arpimd
    self.uuid = Bridge::Users::Create.call(self)
    ##logic if already exists?
    self.save
  end

  # ORIGINAL_CODE

  # def spent_between_two_date(date1, date2)
  #   operations.select do |operation|
  #     operation.date < date2 && operation.date > date1 # filter operations within two date
  #   end.map do |operation|                             # operation to operation.amount (float)
  #     operation.amount
  #   end.inject(0) { |sum, x| sum + x }                 # sum the elements of the array (float)
  # end

  # TEST_CODE

  def spent_between_two_date(date1, date2)
    operations.select do |operation|
      operation.subscription.present? &&
      operation.date < date2 && operation.date > date1 # filter operations within two date
    end.map do |operation|                             # operation to operation.amount (float)
      operation.amount
    end.inject(0) { |sum, x| sum + x }.abs                 # sum the elements of the array (float)
  end

  def last_month_spent
    start_date = Date.at_beginning_of_month - 1.month
    end_date = Date.at_end_of_month - 1.month
    spent_between_two_date(start_date, end_date)
  end

  def last_month_var
    start_date_2 = Date.at_beginning_of_month - 2.month
    end_date_2 = Date.at_end_of_month - 2.month
    last_month_spent - spent_between_two_date(start_date_2, end_date_2)
  end

  def last_month_trend
    if last_month_var > 0
      "arrow_up"
    else
      "arrow_down"
    end
  end
end

