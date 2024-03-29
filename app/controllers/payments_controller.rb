class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    @payments = @budget.payments
  end

  def new
    @payment = @budget.payments.new
  end

  def edit

  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PaymentPdf.new(@payment)
        send_data pdf.render, filename: "recu_paiement_#{@hoa.name}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def create
    @payment = @budget.payments.new(payment_params)
    @payment.lot = @payment.owner.lots.last
    if @payment.save
      redirect_to @budget, notice: "Paiement ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to @budget, notice: "Paiement modifié avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy
    redirect_to @budget, notice: "Paiement supprimé avec succès !"
  end

  private

  def set_budget
    @budget = current_user.budgets.find(params[:budget_id])
    @hoa = @budget.hoa
  end

  def set_payment
    @payment = @budget.payments.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(
      :owner_id,
      :amount,
      :paid_at,
      :mean
    )
  end
end
