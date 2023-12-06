class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.author_id = session.fetch(:student_id)
    comment.uploaded_file_id = params.fetch("input_uploaded_file_id")
    comment.body = params.fetch("input_body")
    comment.save
    redirect_to("/uploaded_files/#{comment.uploaded_file_id}")
  end
end
