class CommentsController < ApplicationController

 def create
  @question = Question.find(params[:question_id])
  @comment = current_user.comments.new(comment_params)
  @comment.question_id = @question.id
  @comment.save

 end

 def destroy
  @question = Question.find(params[:question_id])
  QuestionComment.find_by(id: params[:id]).destroy

 end

 private

 def comment_params
  params.require(:comment).permit(:comment)
 end

end
