class AnswersController < ApplicationController
	before_action :answer_params, only: :create
	def new
		@question = Question.find_by(id: params[:format])
		@answer = @question.answers.new
	end

	def create
		@answer = current_user.answers.new(answer_params)
		@answer.save
		redirect_to question_path(params[:answer][:question_id])
	end

	private

	def answer_params
		params.require(:answer).permit(:body,:question_id)
	end
end
