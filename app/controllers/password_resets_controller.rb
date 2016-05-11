class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Na vašu je adresu poslan e-mail s podacima za promjenu lozinke."
      redirect_to root_url
    else
      flash.now[:danger] = "E-mail adresa nije pronađena."
      render 'new'
    end
  end
  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "ne može biti prazna.")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Lozinka je uspješno izmjenjena."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid users.
  def valid_user
    unless (@user && @user.activated? &&
        @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Zahtjev za promjenom lozinke je istekao."
      redirect_to new_password_reset_url
    end
  end
end
