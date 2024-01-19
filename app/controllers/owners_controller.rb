class OwnersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  def index
    @owners = current_user.owners  
  end

  def new
    @owner = current_user.owners.new
  end

  def edit
    
  end

  def show
    
  end

  def create
    @owner = current_user.owners.new(owner_params)
    if @owner.save
      redirect_to @owner, notice: "Propriétaire ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @owner.update(owner_params)
      redirect_to @owner, notice: "Propriétaire modifié avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @owner.destroy
    redirect_to owners_path, notice: "Propriétaire supprimé avec succès !"
  end

  private

  def set_owner
    @owner = current_user.owners.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(
      :name,
      :status,
      :street,
      :zip,
      :town,
      :country,
      :email,
      :phone
    )
  end
end