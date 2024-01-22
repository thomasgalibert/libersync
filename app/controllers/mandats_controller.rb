class MandatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hoa
  before_action :set_mandat, only: [:show, :edit, :update, :destroy]

  def index
    @mandats = @hoa.mandats  
  end

  def new
    @mandat = @hoa.mandats.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @mandat = @hoa.mandats.new(mandat_params)
    if @mandat.save
      redirect_to hoa_mandats_path(@hoa), notice: "Mandat ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mandat.update(mandat_params)
      redirect_to hoa_mandats_path(@hoa), notice: "Mandat modifié avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mandat.destroy
    redirect_to hoa_mandats_path(@hoa), notice: "Mandat supprimé avec succès !"
  end

  private

  def set_hoa
    @hoa = current_user.hoas.find(params[:hoa_id])
  end

  def set_mandat
    @mandat = @hoa.mandats.find(params[:id])
  end

  def mandat_params
    params.require(:mandat).permit(
      :sexe,
      :name,
      :street,
      :zip,
      :town,
      :country,
      :phone,
      :email,
      :signature,
      :since_at,
      :until_at,
      :job
    )
  end
end