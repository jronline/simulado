class HelperObjectsController < ApplicationController
  before_action :set_helper_object, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :require_admin
  

  # GET /helper_objects
  # GET /helper_objects.json
  def index
    @helper_objects = HelperObject.all
  end

  # GET /helper_objects/1
  # GET /helper_objects/1.json
  def show
  end

  # GET /helper_objects/new
  def new
    @helper_object = HelperObject.new
  end

  # GET /helper_objects/1/edit
  def edit
  end

  # POST /helper_objects
  # POST /helper_objects.json
  def create

    @question = Question.find(params[:question_id])
    @helper_object = @question.helper_objects.create(helper_object_params)

    respond_to do |format|
      if @helper_object.save
        format.html { redirect_to question_path(@question), notice: t("helpers.informations.successfully_created", :model => @helper_object.model_name.human.titleize) }
        format.json { render :show, status: :created, location: @helper_object }
      else
        format.html { render :new }
        format.json { render json: @helper_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helper_objects/1
  # PATCH/PUT /helper_objects/1.json
  def update
    respond_to do |format|
      if @helper_object.update(helper_object_params)
        format.html { redirect_to @helper_object.question, notice: t("helpers.informations.successfully_created", :model => @helper_object.model_name.human.titleize) }
        format.json { render :show, status: :ok, location: @helper_object }
      else
        format.html { render :edit }
        format.json { render json: @helper_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helper_objects/1
  # DELETE /helper_objects/1.json
  def destroy
    @question = Question.find(params[:question_id])
    @helper_object = HelperObject.find(params[:id])
    @helper_object.destroy
    respond_to do |format|
      format.html { redirect_to question_path(@question), notice: t("helpers.informations.successfully_created", :model => @helper_object.model_name.human.titleize) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helper_object
      @helper_object = HelperObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def helper_object_params
      params.require(:helper_object).permit(:title, :text, :font, :question_id, :image)
    end
end
