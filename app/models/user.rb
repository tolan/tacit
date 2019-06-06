class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :operations
  has_many :subscriptions, through: :operations
  has_many :operators, through: :subscriptions
  has_many :accounts
  has_many :banks, through: :accounts

  def has_bridge_account?
    self.uuid.present?
  end

  def create_bridge_user!
    #check with TA arpimd
    self.uuid = Bridge::Users::Create.call(self)
    self.save
  end
end

