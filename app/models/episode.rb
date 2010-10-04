class Episode < ActiveRecord::Base

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings

  attr_accessor :tag_names

  has_attached_file :asset,
    :path => ":rails_root/public/system/episides/episode:id.mp3",
    :url => "/system/episides/episode:id.mp3"

  # Validations
  validates_presence_of :permalink
  validates_presence_of :number
  validates_numericality_of :number

  # Pagination stuff
  cattr_reader :per_page
  @@per_page = 10

  def to_param
    "#{self.id}-#{self.permalink}"
  end

  def tag_names=(names)
    self.tags = Tag.with_names names.split
  end

  def tag_names
    tags.collect(&:name).join(' ')
  end
end
