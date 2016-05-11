class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        render :js => "window.location = '#{root_path}'"
        #redirect_back_or root_url
      else
        message  = "Račun nije aktiviran. "
        message += "Provjerite mail za aktivacijski link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Pogresna lozinka/email"
      redirect_to root_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
