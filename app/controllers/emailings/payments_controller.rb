class Emailings::PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @payment = Payment.find(params[:payment_id])
    PaymentMailer.with(payment: @payment).notify_owner.deliver_now
    redirect_to budget_path(@payment.budget), notice: "Email envoyé avec succès !"
  end
end