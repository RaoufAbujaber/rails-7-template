class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = session[:student_id]
    @comment.uploaded_file_id = params[:comment][:uploaded_file_id]

    if @comment.save
      redirect_to "/uploaded_files/#{@comment.uploaded_file_id}", notice: 'Comment was successfully added.'
    else
      redirect_to "/uploaded_files/#{@comment.uploaded_file_id}", alert: 'Error adding comment.'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
