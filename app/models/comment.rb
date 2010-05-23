class Comment < ActiveRecord::Base
  belongs_to :episode
  attr_accessor :antispam
  attr_accessor :antispam_question
  
  validates_presence_of :name, :on => :create, :message => "És obligatori introduir un nom"

  validates :email,   
            :presence => true, 
            :email_format => true  

  validates_presence_of :content, :on => :create, :message => "No has escrit res!"

  validates_with AntispamValueValidator  
  
  def request=(request)
     self.user_ip    = request.remote_ip
     self.user_agent = request.env['HTTP_USER_AGENT']
     self.user_referrer   = request.env['HTTP_REFERER']
   end
  
end
