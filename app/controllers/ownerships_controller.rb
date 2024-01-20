class OwnershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lot
  before_action :set_ownership, only: [:show, :edit, :update, :destroy]

  def index
    @ownerships = @lot.ownerships  
  end

  def new
    @ownership = @lot.ownerships.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @ownership = @lot.ownerships.new(ownership_params)
    if @ownership.save
      redirect_to hoa_lot_path(@hoa, @lot), notice: "Période ajoutée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ownership.update(ownership_params)
      redirect_to hoa_lot_path(@hoa, @lot), notice: "Période modifiée avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ownership.destroy
    redirect_to hoa_lot_path(@hoa, @lot), notice: "Période supprimée avec succès !"
  end

  private

  def set_lot
    @lot = current_user.lots.find(params[:lot_id])
    @hoa = @lot.hoa
  end

  def set_ownership
    @ownership = @lot.ownerships.find(params[:id])
  end

  def ownership_params
    params.require(:ownership).permit(
      :owner_id,
      :since_at,
      :until_at,
      :splitting
    )
  end
end