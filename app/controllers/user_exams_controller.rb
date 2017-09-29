class UserExamsController < ApplicationController
  before_action :set_user_exam, only: [:show, :edit, :update, :destroy]

  # GET /user_exams
  # GET /user_exams.json
  def index
    @user_exams = UserExam.all
  end

  # GET /user_exams/1
  # GET /user_exams/1.json
  def show
  end

  # GET /user_exams/new
  def new
    @user_exam = UserExam.new
  end

  # GET /user_exams/1/edit
  def edit
  end

  # POST /user_exams
  # POST /user_exams.json
  def create
    @user_exam = UserExam.new(user_exam_params)
    @user_exam.user_id = current_user.id

    respond_to do |format|
      if @user_exam.save
        format.html { redirect_to @user_exam, notice: 'User exam was successfully created.' }
        format.json { render :show, status: :created, location: @user_exam }
      else
        format.html { render :new }
        format.json { render json: @user_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_exams/1
  # PATCH/PUT /user_exams/1.json
  def update
    respond_to do |format|
      if @user_exam.update(user_exam_params)
        format.html { redirect_to @user_exam, notice: 'User exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_exam }
      else
        format.html { render :edit }
        format.json { render json: @user_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_exams/1
  # DELETE /user_exams/1.json
  def destroy
    @user_exam.destroy
    respond_to do |format|
      format.html { redirect_to user_exams_url, notice: 'User exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_exam
      @user_exam = UserExam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_exam_params
      params.require(:user_exam).permit(:title, :user_id, :area_id, :date_application)
    end
end
