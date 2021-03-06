# This migration comes from has_friendship_engine (originally 1)
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class CreateFriendships < ActiveRecord::Migration[4.2]; end
else
  class CreateFriendships < ActiveRecord::Migration; end
end

CreateFriendships.class_eval do
  def self.up
    create_table :friendships do |t|
      t.references :friendable, polymorphic: true
      t.integer :user_id
      t.integer  :friend_id
      t.string   :status
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :friendships
  end
end
