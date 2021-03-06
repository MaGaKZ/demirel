class AssignmentsController < ApplicationController
  before_action :set_assignment, only: :show
  before_action :admin_user, only: [:edit,:update,:destroy,:create]
  # GET /assignments
  # GET /assignments.json
  def index
    @subject = Subject.find(params[:subject_id])
    @assignments = @subject.assignments
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @users=User.all
     @assignment = Assignment.find(params[:id])
    @comments=Comment.where(:assignment_id =>@assignment)
  end

  # GET /assignments/new
  def new
    @subject= Subject.find(params[:subject_id])
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @subject= Subject.find(params[:subject_id])
    @assignment = @subject.assignments.new(assignment_params)
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to :root, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?||current_user.teacher?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:content, :subject_id, :user_id,:attachment)
    end
end
