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
end
