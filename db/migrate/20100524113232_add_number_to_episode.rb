class AddNumberToEpisode < ActiveRecord::Migration
  def self.up
    add_column :episodes, :number, :integer
  end

  def self.down
    remove_column :episodes, :number
  end
end
