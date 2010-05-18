class AddAssetToEpisode < ActiveRecord::Migration
  def self.up
    add_column :episodes, :asset_file_name, :string
    add_column :episodes, :asset_content_type, :string
    add_column :episodes, :asset_file_size, :integer
    add_column :episodes, :asset_updated_at, :datetime
  end

  def self.down
    remove_column :episodes, :asset_file_name
    remove_column :episodes, :asset_content_type
    remove_column :episodes, :asset_file_size
    remove_column :episodes, :asset_updated_at
  end
end
