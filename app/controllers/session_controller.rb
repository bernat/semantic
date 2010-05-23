class SessionController < ApplicationController

  def login
    authenticate
    redirect_to root_path, :notice => "Benvingut"
  end

  def logout
    do_logout
    redirect_to root_path, :notice => "Byebye"
  end

end
