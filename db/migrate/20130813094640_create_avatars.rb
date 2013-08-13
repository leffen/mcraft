class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :image
      t.string :remote_image_url

      t.timestamps
    end
  end
end
