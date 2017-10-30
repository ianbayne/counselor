class AnswersController < ApplicationController
  skip_before_action :authenticate_person!, only: [:new, :create]

  def new
    @answer = Answer.new
  end

  def create
    @checked_question_ids = params[:answer][:question_id]
    @active_questions = Question.where(active: true)
    @answers = []

    @active_questions.each do |question|
      if @checked_question_ids.include? question.id.to_s
        @answers.push(Answer.new(question: question, content: 1))
      else
        @answers.push(Answer.new(question: question, content: 0))
      end
    end

    @answers.push(Answer.new(
      question: Question.find(6),
      content: params[:answer][:gender].to_i))

    session[:answers] = @answers
    redirect_to new_user_registration_path
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id)
  end
end