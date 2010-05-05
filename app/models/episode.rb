class Episode < ActiveRecord::Base
  has_many :comments
end
