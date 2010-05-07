class Episode < ActiveRecord::Base
  has_many :comments


  # Validations
  validates_presence_of :permalink

  def to_param
    "#{self.id}-#{self.permalink}"
  end
end
