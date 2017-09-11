class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def facebook
   # You need to implement the method below in your model (e.g. app/models/user.rb)
   @user = User.from_omniauth(request.env["omniauth.auth"])

   if @user.persisted?
     sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
   else
     session["devise.facebook_data"] = request.env["omniauth.auth"]
     redirect_to new_user_registration_url
   end

   puts "===="
   puts request.env["omniauth.auth"].inspect #pour visualiser ce que omniauth recupere
   puts "===="
 end

  def linkedin
     omniauth_hash = env["omniauth.auth"]
     current_user.create_linkedin_connection(
       :token  => omniauth_hash["extra"]["access_token"].token,
       :secret => omniauth_hash["extra"]["access_token"].secret,
       :uid    => omniauth_hash["uid"]
     )
     redirect_to root_path, :notice => "You've successfully connected your LinkedIn account."
   end

 def failure
   redirect_to root_path
 end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
