class Episode < ActiveRecord::Base
  include Paperclip
  has_many :comments
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings  
  attr_accessor :tag_names

  has_attached_file :asset,
    :path => ":rails_root/public/system/episides/episode:number.mp3",
    :url => "/system/episides/episode:number.mp3"

  # Validations
  validates_presence_of :permalink
  validates_presence_of :number
  validates_numericality_of :number

  def to_param
    "#{self.number}-#{self.permalink}"
  end
  
  def tag_names=(names)
    self.tags = Tag.with_names(names.split(/\s+/))
  end
  
end
