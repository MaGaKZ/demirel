class MarksController < ApplicationController
  def new
    @subject=Subject.find(params[:subject_id])
    @mark=Mark.new
  end
  def index
    @subject=Subject.find(params[:subject_id])
    @users=@subject.users
    @mark=Mark.new
  end
  def create
    @subject=Subject.find(params[:subject_id])
    @mark=@subject.marks.new(mark_params)
     if @mark.save
       flash[:success] = "Mark created successfully!"
       redirect_to root_path
    else
      render 'new'
    end
  end
  private
   def mark_params
     params.require(:mark).permit(:value,:user_id,:subject_id)
    end
end