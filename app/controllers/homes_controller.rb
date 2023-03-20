class HomesController < ApplicationController

  before_action :get_question, only: [:follow_topic,:follow_user]
  
  def index
    @questions = Question.all
  end

  def follow_topic
    topic = Topic.find(params[:topic_id])
    unless current_user.topics.include?(topic)
      current_user.topics << topic
    else
      flash[:notice] = "Already following"
    end
    redirect_to question_path(@question)
  end  

  def follow_user
    user = User.find(params[:user_id])
    current_user.following << user
    redirect_to question_path(@question)
  end

  private
  def get_question
    @question = Question.find(params[:question_id])    
  end
end
