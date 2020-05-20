class ShareVideosController < ApplicationController
  before_action :check_login

  def videos
    @videos = current_user.share_videos
  end

  def new
    @share_video = current_user.share_videos.new
  end

  def create
    @share_video = current_user.share_videos.new(video_params)
    if @share_video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def video_params
    params.require(:share_video).permit(:video_url)
  end
end
