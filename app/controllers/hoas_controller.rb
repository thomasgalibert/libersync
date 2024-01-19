class HoasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hoa, only: [:show, :edit, :update, :destroy]

  def index
    @hoas = current_user.hoas  
  end

  def new
    @hoa = current_user.hoas.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @hoa = current_user.hoas.new(hoa_params)
    if @hoa.save
      redirect_to @hoa, notice: "Association ajoutée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @hoa.update(hoa_params)
      redirect_to @hoa, notice: "Association modifiée avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hoa.destroy
    redirect_to hoas_path, notice: "Association supprimée avec succès !"
  end

  private

  def set_hoa
    @hoa = current_user.hoas.find(params[:id])
  end

  def hoa_params
    params.require(:hoa).permit(
      :name,
      :street,
      :zip,
      :town,
      :country,
      :email,
      :phone
    )
  end
end