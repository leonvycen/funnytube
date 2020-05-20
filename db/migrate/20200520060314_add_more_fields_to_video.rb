class AddMoreFieldsToVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :share_videos, :uid, :string
    add_column :share_videos, :title, :string
    add_column :share_videos, :likes, :integer
    add_column :share_videos, :dislikes, :integer
    add_column :share_videos, :published_at, :datetime
  end
end
