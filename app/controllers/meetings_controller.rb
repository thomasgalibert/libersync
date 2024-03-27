class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all    
  end

  def new
    @meeting = Meeting.new
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = MeetingPdf.new(@meeting)
        send_data pdf.render, 
          filename: @meeting.pdf_name, 
          type: "application/pdf", 
          disposition: "inline"
      end
    end
  end

  def edit
    
  end

  def create
    @meeting = Meeting.create(meeting_params)
    redirect_to @meeting, notice: "Assemblée générale ajoutée avec succès !"
  end

  def update
    @meeting.update(meeting_params)
    redirect_to @meeting, notice: "Assemblée générale modifiée avec succès !"
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path, notice: "Assemblée générale supprimée avec succès !"
  end

  private

  def meeting_params
    params.require(:meeting).permit(
      :name,
      :start_time,
      :summary,
      :location,
      :hoa_id,
      :days
    )
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end