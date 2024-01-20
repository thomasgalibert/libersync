class LotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hoa
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  def index
    @lots = @hoa.lots  
  end

  def new
    @lot = @hoa.lots.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @lot = @hoa.lots.new(lot_params)
    @lot.user = current_user
    if @lot.save
      redirect_to @hoa, notice: "Lot ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @lot.update(lot_params)
      redirect_to hoa_lot_path(@hoa, @lot), notice: "Lot modifié avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lot.destroy
    redirect_to @hoa, notice: "Lot supprimé avec succès !"
  end

  private

  def set_hoa
    @hoa = current_user.hoas.find(params[:hoa_id])
  end

  def set_lot
    @lot = @hoa.lots.find(params[:id])
  end

  def lot_params
    params.require(:lot).permit(
      :number,
      :description,
      :street,
      :zip,
      :town,
      :country,
      :surface,
      :shares
    )
  end
end