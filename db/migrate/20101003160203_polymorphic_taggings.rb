class PolymorphicTaggings < ActiveRecord::Migration
  def self.up
    add_column :taggings, :taggable_id, :integer
    add_column :taggings, :taggable_type, :string
    Tagging.all.each do |tagging|
      if tagging.episode_id.present?
        tagging.taggable_type  = 'Episode'
        tagging.taggable_id    = tagging.episode_id
      elsif tagging.screencast_id.present?
        tagging.taggable_type  = 'Screencast'
        tagging.taggable_id    = tagging.screencast_id
      end
      tagging.save!
    end
    remove_column :taggings, :episode_id
    remove_column :taggings, :screencast_id
  end

  def self.down
    add_column :taggings, :screencast_id, :integer
    add_column :taggings, :episode_id, :integer
    Tagging.all.each do |tagging|
      if tagging.taggable_type == 'Episode'
        tagging.episode_id = tagging.taggable_id
      elsif tagging.taggable_type == 'Screencast'
        tagging.screencast_id = tagging.taggable_id
      end
      tagging.save!
    end
    remove_column :taggings, :taggable_id
    remove_column :taggings, :taggable_type
  end
end
