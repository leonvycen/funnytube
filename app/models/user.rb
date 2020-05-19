class User < ApplicationRecord
  has_secure_password
  has_many :share_videos, dependent: :destroy
end
