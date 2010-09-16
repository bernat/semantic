class Tagging < ActiveRecord::Base
  belongs_to :episode
  belongs_to :screencast
  belongs_to :tag
end
