class SessionsController < ApplicationController
 attr_accessor :remember_me

  def new
  end

  def create
    puts params[:session][:remember_me]
    user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
     login user
     if params[:session][:remember_me]
       cookies.permanent.signed[:remember_me] = current_user.id
     end
      redirect_to '/'
     # Log the user in and redirect to the user's show page.
   else
     # Create an error message.
     flash.now[:danger] = 'Invalid email/password combination'
     render 'new'
   end
  end

  def destroy
    logout
    redirect_to '/', notice: "You have successfully logged out."
  end
end
