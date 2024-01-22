class PaymentPresenter < Keynote::Presenter
  presents :payment

  def paid_at
    display_date(payment.paid_at)
  end

  def amount
    number_to_currency(payment.amount)
  end

  def mean
    "par " + t("activerecord.attributes.payment.means.#{payment.mean}")
  end
end
