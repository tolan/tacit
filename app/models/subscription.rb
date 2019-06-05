class Subscription < ApplicationRecord
  belongs_to :operator
  has_many :operations
end
