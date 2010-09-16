class AddScreencastIdToTaggings < ActiveRecord::Migration
  def self.up
    add_column :taggings, :screencast_id, :integer
  end

  def self.down
    remove_column :taggings, :screencast_id
  end
end
