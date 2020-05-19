class ShareVideosController < ApplicationController
  before_action :check_login

  def videos
  end

  def new
    @share_video = current_user.share_videos.new
  end

  def create
  end
end
