class AlternativesController < ApplicationController
  before_action :set_alternative, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :require_admin

  # GET /alternatives
  # GET /alternatives.json
  def index
    @alternatives = Alternative.all
  end

  # GET /alternatives/1
  # GET /alternatives/1.json
  def show
  end

  # GET /alternatives/new
  def new
    @alternative = Alternative.new
  end

  # GET /alternatives/1/edit
  def edit
  end

  # POST /alternatives
  # POST /alternatives.json
  def create
    @question = Question.find(params[:question_id])
    @alternative = @question.alternatives.create(alternative_params)

    respond_to do |format|
      if @alternative.save
        format.html { redirect_to @question, notice: t("helpers.informations.successfully_created", :model => @alternative.model_name.human.titleize) }
        format.json { render :show, status: :created, location: @alternative }
      else
        format.html { render :new }
        format.json { render json: @alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alternatives/1
  # PATCH/PUT /alternatives/1.json
  def update
    respond_to do |format|
      if @alternative.update(alternative_params)
        format.html { redirect_to @question, notice: t("helpers.informations.successfully_updated", :model => @alternative.model_name.human.titleize) }
        format.json { render :show, status: :ok, location: @alternative }
      else
        format.html { render :edit }
        format.json { render json: @alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alternatives/1
  # DELETE /alternatives/1.json
  def destroy
    @question = Question.find(params[:question_id])
    @alternative = Alternative.find(params[:id])
    @alternative.destroy
    respond_to do |format|
      format.html { redirect_to question_path(@question), notice: t("helpers.informations.successfully_destroyed", :model => @alternative.model_name.human.titleize) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alternative
      @alternative = Alternative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alternative_params
      params.require(:alternative).permit(:title, :veracity, :question_id)
    end
end
