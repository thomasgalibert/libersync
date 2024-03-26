# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/notify_owner
  def notify_owner
    PaymentMailer.with(payment: Payment.last).notify_owner
  end

end
