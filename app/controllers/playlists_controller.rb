class PlaylistsController < ApplicationController

	def index
		@@playlist = Playlist.find_by_id_and_id_korisnik(params[:id_playlist].to_i, current_user.id)
		@potvrden = @@playlist.potvrden
		loadTracks
	end

	def show
		@playliste = Playlist.where(:id_korisnik => current_user.id)
		@playliste = @playliste.sort_by &:datum_unosa
	end

	def add
		if @@playlist.potvrden then
			flash[:info] = "Lista je već potvrđena i ne možete ju mjenjati."
		else
			if @@playlist.sadrzi_zapis.empty? then
				mjesto = 0
			else
				mjesto = @@playlist.sadrzi_zapis[-1].mjesto + 1
			end

			@@playlist.sadrzi_zapis << SadrziZapi.new(:id_playlist => @@playlist.id, :mjesto => mjesto, :id_zapis => params[:track_index])
		end
		redirect_to action: 'index', id_playlist: @@playlist.id
	end

	def new
	end

	def create
		termin = current_user.termin_urednika
		datum = params["date"].map{|k,v| v}.join("-").to_date
		datum_izvrsenja = Time.new(datum.year, datum.mon, datum.mday, termin.hour+1, 0, 0)

		playliste = Playlist.where(:id_korisnik => current_user.id)
		playliste.each { |list|

			if list.datum_unosa == datum then
			flash[:danger] = "Playlista za zadani datum već postoji."
			redirect_to action: 'new'
			return
		end
		}
		playlist = Playlist.create(:id_korisnik => current_user.id)
		playlist.update_attributes(:datum_unosa =>  datum, :datum_izvrsenja => datum_izvrsenja)

		flash[:info] = "Nova playlista je uspješno napravljena."
		redirect_to action: 'index', id_playlist: playlist.id
	end



	def delete
		if @@playlist.potvrden then
			flash[:info] = "Lista je već potvrđena i ne možete ju mjenjati."
		end
		puts params[:id_delete]
		@zapis = SadrziZapi.where(:id_zapis => params[:id_delete], :id_playlist => @@playlist.id).first
		@zapis.destroy
		@@playlist
		redirect_to action: 'index', id_playlist: @@playlist.id
	end


	def potvrdi
		if @@playlist.potvrden then
			flash[:info] = "Lista je već potvrđena."
		else
			@@playlist.potvrden = true
			@@playlist.save
		end
		redirect_to action: 'index', id_playlist: @@playlist.id
	end


	def get_zelje
		@zelje = Playlist.get_zelje
		render 'zelje'
	end


	def loadTracks
		@vrijeme = 0
		@pjesmePlaylist = []
		@@playlist.sadrzi_zapis.each { |track|
			pjesma = Track.find(track.id_zapis)
			@pjesmePlaylist << pjesma
			@vrijeme += pjesma.minute*60 + pjesma.sekunde
			@prevec = false
			if @vrijeme > 3300 and @vrijeme < 3600 and not @@playlist.potvrden then
				flash.now[:info] = "Dužina vaše playliste se približava dozvoljenoj granici od sat vremena."
            elsif @vrijeme >= 3600 and not @@playlist.potvrden then
            	flash.delete(:info)
            	flash.now[:danger] = "Vaša playlista je dostigla dozvoljenu dužinu."
            	@prevec = true
            end
		}
	end

end
