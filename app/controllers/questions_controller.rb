class QuestionsController < ApplicationController
	before_action :question_params , only: :create

	def index
		@users = current_user.following
	end

	def show
		@question = Question.find_by(id: params[:id])
	end

	def new
		@question = Question.new
	end
	
	def create
		if params[:question][:topic]
			if Topic.find_by(body: params[:question][:topic]).present?
				@topic = Topic.find_by(body: params[:question][:topic])
			else
				@topic = current_user.topics.find_or_create_by(body: params[:question][:topic])
			end
		end
		@question = current_user.questions.new(question_params.merge(topic_id: @topic.id))
		if @question.save
			@answer = @question.answers.create(body: params[:question][:answer],user_id: current_user.id) if params[:question][:answer]
		end
		redirect_to root_path
	end

	private

	def question_params
		params.require(:question).permit(:body)
	end
end
