class QuestionsController < ApplicationController

  def new
   @question = Question.new
  end

  def edit
   @question = Question.find(params[:id])
   if @question.user == current_user
   else
    redirect_to questions_path
   end
  end

  def create
   @question = Question.new(post_params)
   @question.user_id = current_user.id
   if @question.save
    flash[:notice] = 'You have created post successfully.'
    redirect_to question_path(@question)
   else
    @questions = Question.all
    @user = current_user
    render :index
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
   @user = current_user
   @question = Question.new

  end

  def show
   @Questiontnew = Question.new
   @question = Question.find(params[:id])
   @user = User.find(@post.user_id)
   @comment = Comment.new
  end

  def destroy
   @question = Question.find(params[:id])
   @question.destroy
   redirect_to questions_path
  end

  private

  def question_params
   params.require(:question).permit(:title, :body)
  end


end
