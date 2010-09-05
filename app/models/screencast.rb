class Screencast < ActiveRecord::Base
  include Paperclip
  has_many :comments
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings  
  attr_accessor :tag_names

  has_attached_file :asset,
    :path => ":rails_root/public/system/screencasts/screencast:id.mp3",
    :url => "/system/screencasts/screencast:id.mp3"
    
  validates_presence_of :permalink
  
  def to_param
    "#{self.id}-#{self.permalink}"
  end
  
end
