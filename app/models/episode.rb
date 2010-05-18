class Episode < ActiveRecord::Base
  include Paperclip
  has_many :comments

  has_attached_file :asset,
    :path => ":rails_root/public/system/episides/episode:id.mp3",
    :url => "/system/episides/episode:id.mp3"

  # Validations
  validates_presence_of :permalink

  def to_param
    "#{self.id}-#{self.permalink}"
  end
end
