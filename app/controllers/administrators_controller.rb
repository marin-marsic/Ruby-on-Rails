class AdministratorsController < ApplicationController

  def index
    @urednici = User.urednici
  end

  def add
    @id = params[:user_index]
    if User.find(@id).uloga == 2 then
      flash[:info] = "Odabrani korisnik je već urednik."
      redirect_to action: "index"
      return
    end
    User.add_editor(@id)
    flash[:success] = "Uspješno dodan novi glazbeni urednik."
    @urednici = User.urednici
    redirect_to action: "index"
  end

  def delete
    @id = params[:id_delete]
    User.remove_editor(@id)
    flash[:success] = "Uspješno uklonjen glazbeni urednik."
    @urednici = User.urednici
    redirect_to action: "index"
  end

  def search
  end

  def online
    @administratori = User.online_administratori(current_user.id)
    @korisnici = User.online_korisnici
  end

  def show
    @@name = params[:q] if params[:q]
    @searched_users = User.search_by_name(@@name)
  end
end
