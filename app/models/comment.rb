class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  semantic_antispam

  validates_presence_of :name, :on => :create, :message => "És obligatori introduir un nom"
  validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates_presence_of :content, :on => :create, :message => "No has escrit res!"
  validates_presence_of :commentable

  default_scope order('created_at asc')

end
