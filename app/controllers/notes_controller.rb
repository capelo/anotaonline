class NotesController < ApplicationController

  def index

  end

  def new
  	
  	if params[:name].blank?
  		@note = Note.random_note
  		@note.save!
      redirect_to root_url.concat(@note.name)
  	else
  		@note = Note.find_by_name(params[:name])
  		if @note.blank?
			  @note = Note.new(note_params)
			  @note.save! 			
  		end
  	end
  	
  end

  def create

  end

  def show
    @note = Note.friendly.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  def update
    @note = Note.find_by_name(params[:name])

    @note.update!(note_params)
  end

  private

  	def note_params
  		params.permit(:name, :body)
  	end

end
