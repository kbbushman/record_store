class RecordsController < ApplicationController

	def index
		#get all records
		@records = Record.all
		#render json: @records (returns json instead of HTML. Could use for JSON API)
	end

	def show
		#show a record by id
		@record = Record.find(params[:id]) # TODO: handle error
		render :show #optional
	end

	def new
		# create a new instance of a record
		@record = Record.new
    render :new #optional
  end

  def create

    Record.create(record_params)
    redirect_to records_path #or use 'redirect_to record' to redirect to newly created record
  end

  def edit
  	@record = Record.find(params[:id])
  end

  def update
  	@record = Record.find(params[:id])
  	@record.update(record_params)
  	redirect_to @record
  end

  def destroy
  	record = Record.find(params[:id])
  	record.destroy
  	redirect_to records_path
  end

  private

  # Below are "strong parameters" used for security purposes
  

  def record_params
    params.require(:record).permit(:title, :artist, :year, :cover_art, :song_count)
  end


end
