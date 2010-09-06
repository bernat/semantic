class Comment < ActiveRecord::Base
  belongs_to :episode
  attr_accessor :antispam
  attr_accessor :antispam_question
  
  validates_presence_of :name, :on => :create, :message => "És obligatori introduir un nom"

  validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates_presence_of :content, :on => :create, :message => "No has escrit res!"

  validate :antispam_value
  
  def request=(request)
     self.user_ip    = request.remote_ip
     self.user_agent = request.env['HTTP_USER_AGENT']
     self.user_referrer   = request.env['HTTP_REFERER']
   end

   private
   def antispam_value
     condition ||= (antispam.to_i == 270 && antispam_question.to_i == 1)
     condition ||= (antispam.to_i == 50 && antispam_question.to_i == 2)
     condition ||= (antispam.to_i == 140 && antispam_question.to_i == 3)
     condition ||= (antispam.to_i == 380 && antispam_question.to_i == 4)
     condition ||= (antispam.to_i == 1000 && antispam_question.to_i == 5)
     errors[:base] = "Es spammer" unless condition
   end
end
