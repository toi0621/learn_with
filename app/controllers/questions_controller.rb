class QuestionsController < ApplicationController

  def new
   @question = Question.new
  end

  def edit
   @question = Question.find(params[:id])
   unless @question.user == current_user
    redirect_to questions_path
   end
  end

  def create
   @question = Question.new(question_params)
   @question.user_id = current_user.id
   if @question.save
    flash[:notice] = 'You have created post successfully.'
    redirect_to question_path(@question)
   else
    # @questions = Question.all
    # @user = current_user
    render :new
   end
  end

  def update
   @question = Question.find(params[:id])
   if @question.update(question_params)
    flash[:notice] = 'You have updated question successfully.'
    redirect_to  question_path(@question)
   else
    render :edit
   end

  end

  def index
   @questions = Question.all
   if params[:genre] != nil
    @questions = Question.where(genre: params[:genre])
   end
   @user = current_user
   @question = Question.new

  end

  def show
   @questiontnew = Question.new
   @question = Question.find(params[:id])
   @user = User.find(@question.user_id)
   @comment = Comment.new
  end

  def destroy
   @question = Question.find(params[:id])
   @question.destroy
   redirect_to questions_path
  end

  private

  def question_params
   params.require(:question).permit(:title, :body, :genre_id)
  end


end
