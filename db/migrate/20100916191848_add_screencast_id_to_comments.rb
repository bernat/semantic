class AddScreencastIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :screencast_id, :integer
    change_column :comments, :episode_id, :integer, :null => true
  end

  def self.down
    remove_column :comments, :screencast_id
  end
end
