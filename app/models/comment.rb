class Comment < ActiveRecord::Base
  belongs_to :episode
  attr_accessor :antispam
  before_create :check_antispam
  
  validates_presence_of :name, :on => :create, :message => "És obligatori introduir un nom"
  validates :email,   
            :presence => true, 
            :email_format => true  
  validates_presence_of :content, :on => :create, :message => "No has escrit res!"

            
  def check_antispam
    @antispam == "26"
  end
  
  def request=(request)
     self.user_ip    = request.remote_ip
     self.user_agent = request.env['HTTP_USER_AGENT']
     self.user_referrer   = request.env['HTTP_REFERER']
   end
  
end
