class Payment < ApplicationRecord
  belongs_to :budget
  belongs_to :owner
  belongs_to :lot
  monetize :amount_cents

  validates :paid_at, :method, presence: true

  enum :method, cash: "cash", wire: "wire", check: "check"
end
