class Comment < ActiveRecord::Base
  belongs_to :episode
  belongs_to :screencast
  
  validates_presence_of :name, :on => :create, :message => "És obligatori introduir un nom"

  validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates_presence_of :content, :on => :create, :message => "No has escrit res!"

  validate :check_intelligence
  attr_accessor :intelligence

  def request=(request)
     self.user_ip    = request.remote_ip
     self.user_agent = request.env['HTTP_USER_AGENT']
     self.user_referrer   = request.env['HTTP_REFERER']
   end

   private
   def check_intelligence
     unless intelligence and intelligence.strip.match /^catal(?:\w+)$/i
       errors[:base] = 'SPAM'
     end
   end

end
