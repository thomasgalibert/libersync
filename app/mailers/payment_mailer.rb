class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.notify_owner.subject
  #
  def notify_owner
    @payment = params[:payment]
    @owner = @payment.owner
    @budget = @payment.budget
    @lot = @payment.lot
    @hoa_name = @budget.hoa.name

    payment_pdf = PaymentPdf.new(@payment)
    attachments["recu_paiement.pdf"] = payment_pdf.render

    mail to: "#{@owner.name} <#{@owner.email}>", subject: "Reçu paiement #{@hoa_name}", from: "ASL #{@hoa_name} <notifications@libersync.com>"
  end
end
