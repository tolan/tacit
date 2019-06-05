class Account < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :operations
end
