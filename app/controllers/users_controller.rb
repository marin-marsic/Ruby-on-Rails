class UsersController < ApplicationController
  #before_action :logged_in_user, only: [:edit, :update,:index,:delete]
  #before_action :correct_user,   only: [:edit, :update]
  #before_action :admin_user,     only: :destroy


  

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Korisnik obrisan"
    redirect_to user_url
  end

  def show
    @user = User.find(params[:id])
  end
  def new
    @user =User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Aktivacijski e-mail poslan je na vašu adresu."
      redirect_to root_url
    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profil ažuriran"
      redirect_to @user
    else
      flash[:danger] = "Podaci nisu uneseni. Molimo pokušajte ponovno."
      redirect_to action: "edit"
    end
  end

  def termin
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile ažuriran"
      redirect_to @user
    else
      redirect_to action: "index"
    end
  end
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Prijavite se."
      redirect_to login_url
    end
  end
  # Confirms the correct users.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :termin_urednika, :id, :ime, :prezime)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


end
