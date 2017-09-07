class HomeController < ApplicationController

  def redirection
    if user_signed_in?
       redirect_to show_url
    else
       redirect_to new_user_session_url
    end
  end

end
