class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :require_admin
  
  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @mock = Mock.find(params[:mock_id])
    @exam = @mock.exams.create(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: t("helpers.informations.successfully_created", model: @exam.model_name.human.titleize) }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: t("helpers.informations.successfully_updated", :model => @exam.model_name.human.titleize) }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    mock = @exam.mock
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to mock, notice: t("helpers.informations.successfully_destroyed", :model => @exam.model_name.human.titleize) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:title, :mock_id)
    end
end
