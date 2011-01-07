class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy

  validates :name, :presence => true

  def self.with_names(names)
    names.collect { |name| Tag.find_or_create_by_name(name) }
  end

  def taggables
    taggings.collect(&:taggable).uniq
  end
  
  def to_s
    name
  end
end
