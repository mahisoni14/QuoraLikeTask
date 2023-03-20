class TopicsController < ApplicationController
	before_action :topic_params, only: :create

	def new
		@question = Question.find(params[:format])
		@topic = Topic.new
	end

	def create
		question = Question.find(params[:topic][:question_id])
		@topic = Topic.find_or_create_by(topic_params)
		redirect_to question_path(question)
	end

	private
	def topic_params
		params.require(:topic).permit(:body)
	end
end
