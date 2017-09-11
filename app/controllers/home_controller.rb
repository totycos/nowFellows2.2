class HomeController < ApplicationController

  def connexion
    if user_signed_in?
       redirect_to show_path
    end
  end

end
