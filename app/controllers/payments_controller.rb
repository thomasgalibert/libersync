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
    
  end

  def create
    @payment = @budget.payments.new(payment_params)
    if @payment.save
      redirect_to @budget, notice: "Paiement ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to budget_payment_path(@budget, @payment), notice: "Paiement modifié avec succès !"
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
  end

  def set_payment
    @payment = @budget.payments.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(
      :owner_id,
      :lot_id,
      :amount,
      :paid_at,
      :method
    )
  end
end