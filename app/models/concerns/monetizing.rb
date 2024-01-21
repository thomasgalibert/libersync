module Monetizing
  extend ActiveSupport::Concern

  included do
    monetize :amount_cents
  end

  # Helpers
  def balance
    amount_cents - payments.sum(:amount_cents)
  end

  def status
    balance > 0 ? 'unpaid' : 'paid'
  end
end