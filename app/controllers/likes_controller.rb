class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to "/students/#{@like.fan_id}", notice: 'File liked successfully.'
    else
      redirect_to "/students/#{@like.fan_id}", alert: 'Unable to like file.'
    end
  end

  private

  def like_params
    params.require(:like).permit(:fan_id, :uploaded_file_id)
  end
end
