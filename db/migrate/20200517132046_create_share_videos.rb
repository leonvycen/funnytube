class CreateShareVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :share_videos do |t|
      t.string :video_url
      t.references :user
      t.timestamps
    end
  end
end
