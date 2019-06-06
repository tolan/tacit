class Operation < ApplicationRecord
  belongs_to :user
  belongs_to :subscription, optional: true
  belongs_to :category
  belongs_to :account, optional: true
  has_one :operator, through: :subscription
  has_one :bank, through: :account
end
