class PolymorphicComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    Comment.all.each do |comment|
      if comment.episode_id.present?
        comment.commentable_type  = 'Episode'
        comment.commentable_id    = comment.episode_id
      elsif comment.screencast_id.present?
        comment.commentable_type  = 'Screencast'
        comment.commentable_id    = comment.screencast_id
      end
      comment.save!
    end
    remove_column :comments, :episode_id
    remove_column :comments, :screencast_id
  end

  def self.down
    add_column :comments, :screencast_id, :integer
    add_column :comments, :episode_id, :integer
    Comment.all.each do |comment|
      if comment.commentable_type == 'Episode'
        comment.episode_id = comment.commentable_id
      elsif comment.commentable_type == 'Screencast'
        comment.screencast_id = comment.commentable_id
      end
      comment.save!
    end
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end
