class Episode < ActiveRecord::Base
  include Paperclip
  has_many :comments
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings  
  attr_accessor :tag_names

  cattr_reader :per_page
  @@per_page = 10

  has_attached_file :asset,
    :path => ":rails_root/public/system/episides/episode:id.mp3",
    :url => "/system/episides/episode:id.mp3"

  # Validations
  validates_presence_of :permalink
  validates_presence_of :number
  validates_numericality_of :number

  def to_param
    "#{self.id}-#{self.permalink}"
  end
  
  def tag_names=(names)
    self.tags = Tag.with_names(names.split(/\s+/))
  end
  
end
