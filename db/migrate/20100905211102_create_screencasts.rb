class CreateScreencasts < ActiveRecord::Migration
  def self.up
    create_table :screencasts do |t|
      t.string :title
      t.string :permalink
      t.text :description
      t.datetime :published_at
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :screencasts
  end
end
