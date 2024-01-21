class BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def index
    @budgets = current_user.budgets  
  end

  def new
    @budget = current_user.budgets.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @budget = current_user.budgets.new(budget_params)
    if @budget.save
      redirect_to @budget, notice: "Budget ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @budget.update(budget_params)
      redirect_to @budget, notice: "Budget modifié avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @budget.destroy
    redirect_to budgets_path, notice: "Budget supprimé avec succès !"
  end

  private

  def set_budget
    @budget = current_user.budgets.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(
      :year,
      :hoa_id,
      :amount
    )
  end
end