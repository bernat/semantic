class PagesController < ApplicationController
  EMAILS = { 'bernat' => 'bernat@itnig.net', 'jordi' => 'jordi@jrom.net', 'masumi' => 'mutsuda@gmail.com' }

  def participant
    @participant = params[:participant]
    @participant_email = EMAILS[@participant]
  end

end
