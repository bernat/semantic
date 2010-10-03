class Tagging < ActiveRecord::Base
  belongs_to :taggable, :polymorphic => true
  belongs_to :tag

  validates :taggable, :presence => true
  validates :tag, :presence => true
end
