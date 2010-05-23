class PagesController < ApplicationController

  def about
  end
  
  def bernat
    @participant = 'bernat'
    @participant_email = 'bernat@itnig.net'
    render 'participant'
  end
  
  def jordi
    @participant = 'jordi'
    @participant_email = 'jordi@jrom.net'
    render 'participant'
  end
  
  def masumi
    @participant = 'masumi'
    @participant_email = 'mutsuda@gmail.com'
    render 'participant'
  end

end