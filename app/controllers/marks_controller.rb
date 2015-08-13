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
       redirect_to :back
    else
      render 'new'
    end
  end
  def destroy
    @mark = Mark.find(params[:subject_id])
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
   def mark_params
     params.require(:mark).permit(:value,:user_id,:subject_id)
    end
end