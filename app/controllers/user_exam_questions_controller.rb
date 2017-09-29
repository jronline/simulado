class UserExamQuestionsController < ApplicationController
  def index
  end
  
  def create

    @user_exam = UserExam.find(params[:user_exam_id])
    @user_exam_question = @user_exam.user_exam_questions.create(user_exam_question_params)

    respond_to do |format|
      if @user_exam_question.save
        format.html { redirect_to @user_exam, notice: t("helpers.informations.successfully_created", :model => @user_exam_question.model_name.human.titleize) } # este helper retorna a frase traduzida de acordo com o modelo passado.
        format.json { render :show, status: :created, location: @user_exam }
      else
        format.html { render :new }
        format.json { render json: @user_exam_question.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @user_exam_question.destroy
    respond_to do |format|
      format.html { redirect_to @user_exam, notice: t("helpers.informations.successfully_destroyed", :model => @user_exam_question.model_name.human.titleize) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_exam_question
    @user_exam_question = UserExamQuestion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_exam_question_params
    params.require(:user_exam_question).permit(:order, :rating, :user_exam_id, :question_id)
  end
end
