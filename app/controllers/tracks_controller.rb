class TracksController < ApplicationController
  def index
    @tracks=Track.first(16);
  end

  def user_params
    params.require(:track).permit(:name, :author, :company)
  end


def search
end

  def edit
    @track = Track.find(params[:id])
  end

def details
	@track = Track.find(params[:track_id])
end

def show
	@@field = params[:search] if params[:search]
	@@name = params[:q] if params[:q]
	@searched_tracks = Track.where(@@field + ' LIKE ?', "%#{@@name}%")
end

def new
  @track = Track.new
end

  def delete
    @id = params[:id_delete]

    # zapis se ne brise ako je na nekoj playlisti
    playlist = Playlist.all
    playlist.each do |p|
      zapis = p.sadrzi_zapis.find_by_id_zapis(@id)
      if zapis != nil then
        flash[:danger] = "Zapis se nalazi na listi za reprodukciju i trenutno se ne može obrisati."
        redirect_to action: "index"
        return
      end
    end

    @track = Track.find(@id)
    @track.destroy
    flash[:info] = "Uspješno uklonjen glazbeni zapis."
    @tracks=Track.first(16);
    redirect_to action: "index"
  end

  def create
    @track = Track.new(music_params)

    if @track.save
      flash[:info] = "Uspješno dodan zapis #{@track.name}."
      puts @track.path
    else
      flash[:danger] = "Greška pri dodavanju zapisa #{@track.name}."
    end
    redirect_to action: "new"
  end

  def update

    @track = Track.find(params[:id])
    if @track.update_attributes(music_params)
      flash[:success] = "Izmjene uspješno pohranjene."
      redirect_to action: "index"
    else
      redirect_to action: "index"
    end
  end

  private
  def music_params
    params.require(:track).permit(:name, :path, :author, :company, :format, :frekvencija, :zanr, :vrsta_nosaca, :godina_izdanja, :minute, :sekunde)
  end

end
