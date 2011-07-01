class CreateAvatars < ActiveRecord::Migration
  def self.up
    create_table :avatars do |t|
      t.string :username
      t.string :campfire
      t.string :image_url

      #should probably be per user vs per avatar
      t.boolean :important

      t.timestamps
    end
    add_index :avatars, :username, :unique => true
    add_index :avatars, :campfire, :unique => true

  end

  def self.down
    drop_table :avatars
  end
end