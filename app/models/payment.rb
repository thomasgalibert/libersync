class Payment < ApplicationRecord
  belongs_to :budget
  belongs_to :owner
  belongs_to :lot
  monetize :amount_cents

  validates :paid_at, :mean, presence: true

  enum :mean, wire: "wire", check: "check", cash: "cash"

  def barcode_input
    "#{budget.id}-#{lot.number}-#{owner.id}-#{self.id}"
  end
end
