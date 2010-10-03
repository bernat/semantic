class Screencast < ActiveRecord::Base

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings  

  attr_accessor :tag_names

  validates_presence_of :permalink

  def to_param
    "#{self.permalink}"
  end

  def tag_names=(names)
    self.tags = Tag.with_names(names.split(/\s+/))
  end

end
