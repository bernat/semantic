class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.string :title
      t.string :permalink
      t.text :description
      t.text :notes
      t.date :aired_on
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
