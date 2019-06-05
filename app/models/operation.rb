class Operation < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  belongs_to :category
  belongs_to :account
  has_one :operator, through: :subscription
  has_one :bank, through: :account
end
