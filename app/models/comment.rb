class Comment < ActiveRecord::Base
  belongs_to :episode
  attr_accessor :antispam
  
  validates_presence_of :name, :on => :create, :message => "És obligatori introduir un nom"
  validates_presence_of :email, :on => :create, :message => "És obligatori introduir un email"
  validates_presence_of :content, :on => :create, :message => "No has escrit res!"
  
  def before_create
    @antispam == "26"
  end
  
  # def request=(request)
  #    self.user_ip    = request.remote_ip
  #    self.user_agent = request.env['HTTP_USER_AGENT']
  #    self.referrer   = request.env['HTTP_REFERER']
  #  end
  
end
