class VlasniksController < ApplicationController

  def index
    @administratori = User.administratori
  end

  def info
    doc = Nokogiri::XML(open("public/info.xml"))

    @naziv = doc.css("naziv").first.text
    @vlasnik = doc.css("vlasnik").first.text
    @email = doc.css("email").first.text
    @tel = doc.css("tel").first.text
  end

  def edit
    @doc = Nokogiri::XML(open("public/info.xml"))

    @n = params[:naziv]
    @v = params[:vlasnik]
    @e = params[:email]
    @t = params[:tel]

    @naziv = @doc.at_css "naziv"
    @naziv.content = @n
    @vlasnik = @doc.at_css "vlasnik"
    @vlasnik.content = @v
    @email = @doc.at_css "email"
    @email.content = @e
    @tel = @doc.at_css "tel"
    @tel.content = @t

    @doc.to_xml
    file = File.new("public/info.xml", "wb")
    file.write(@doc)
    file.close
    flash[:success] = "Ažurirani podaci."
    redirect_to :controller => 'main', :action => 'home'
  end

  def add
    @id = params[:user_index]
    @n = User.administratori.count
    if User.find(@id).uloga == 1 then
      flash[:info] = "Odabrani korisnik je već administrator."
      redirect_to action: "index"
      return
    end
    if @n == 10
      flash[:danger] = "Administrator nije dodan. Dosegnut limit: 10"
      redirect_to action: "index"
      return
    end

    User.add_admin(@id)
    flash[:success] = "Uspješno dodan novi administrator."
    @n = User.administratori.count

    if @n == 10
      flash[:info] = "Dosegnut limit: 10."
    end
    @administratori = User.administratori
    redirect_to action: "index"
  end

  def delete
    @id = params[:id_delete]
    User.remove_admin(@id)
    flash[:success] = "Uspješno uklonjen administrator."
    @administratori = User.administratori
    redirect_to action: "index"
  end
end
