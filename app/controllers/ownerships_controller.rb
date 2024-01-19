class OwnershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lot
  before_action :set_ownserhip, only: [:show, :edit, :update, :destroy]

  def index
    @ownserhips = @lot.ownserhips  
  end

  def new
    @ownserhip = @lot.ownserhips.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @ownserhip = @lot.ownserhips.new(ownserhip_params)
    if @ownserhip.save
      redirect_to @lot, notice: "Période ajoutée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ownserhip.update(ownserhip_params)
      redirect_to @lot, notice: "Période modifiée avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ownserhip.destroy
    redirect_to @lot, notice: "Période supprimée avec succès !"
  end

  private

  def set_lot
    @lot = current_user.lots.find(params[:lot_id])
  end

  def set_ownserhip
    @ownserhip = @lot.ownserhips.find(params[:id])
  end

  def ownserhip_params
    params.require(:ownserhip).permit(
      :owner_id,
      :since_at,
      :until_at
    )
  end
end