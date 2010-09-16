class CreateScreencasts < ActiveRecord::Migration
  def self.up
    create_table :screencasts do |t|
      t.string :title
      t.string :permalink
      t.string :ref
      t.text :description
      t.text :notes
      t.datetime :published_at
      t.string :embedded
      t.timestamps
    end
  end

  def self.down
    drop_table :screencasts
  end
end
