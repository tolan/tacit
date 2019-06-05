class Operator < ApplicationRecord
  has_many :subscriptions
  has_many :operations, through: :subscriptions
end
