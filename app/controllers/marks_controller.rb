class MarksController < ApplicationController
  def new
    @mark=Mark.new
  end
  def index
    @users=U
  end
  def create
    @mark=Mark.new(mark_params)
     if @mark.save
       flash[:success] = "Mark created successfully!"
       redirect_to subjects_path
    else
      render 'new'
    end
  end
  private
   def mark_params
     params.require(:mark).permit(:value,:user_id,:subject_id)
    end
end