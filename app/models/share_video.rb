class ShareVideo < ApplicationRecord
  belongs_to :user

  before_save :info_from_yt

  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  validates :video_url, presence: true, format: YT_LINK_FORMAT

  def info_from_yt
    video = Yt::Video.new url: video_url
    if video
      self.uid = video.id
      self.title = video.title
      self.likes = video.like_count
      self.dislikes = video.dislike_count
      self.published_at = video.published_at
    end
  end
end
