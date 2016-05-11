class Playlist < ActiveRecord::Base
	has_many :sadrzi_zapis, :foreign_key => "id_playlist"


	def self.get_zelje
		tracks = Hash.new(0)
		ListaZelja.where('potvrden_at >= :todayA and potvrden_at <= :todayB', :todayA  => Time.now - 3.days, :todayB => Time.now).each { |lista|
			if lista.potvrden then
				lista.cuva_zapis.find_each { |zapis|
					tracks[Track.find(zapis.id_zapis)] +=1
				}
			end
		}
		Hash[tracks.sort_by { |k, v | v}.reverse]
	end

	def self.trenutno_svira
		now = Time.now + 1.hour
		playlist_time = now - now.min*60 - now.sec

		@p = Playlist.where('datum_izvrsenja >= :todayA and datum_izvrsenja <= :todayB', :todayA  => playlist_time - 5*60, :todayB => playlist_time + 5*60).order(:datum_izvrsenja).first

		if @p.blank? then
			@p = Playlist.all.first
			if @p.blank? then
				return Array.new
			end
		end

		i = 0
		count = @p.sadrzi_zapis.count
		while playlist_time < now  do
			@zapis1 = Track.find(@p.sadrzi_zapis[i%count].id_zapis)
			puts @zapis1.minute
			puts @zapis1.sekunde
			puts i
			playlist_time = playlist_time + @zapis1.minute*60 + @zapis1.sekunde
			i +=1
		end

		if playlist_time.hour > now.hour then
			playlist_time = playlist_time - playlist_time.min*60
			@p = Playlist.where('datum_izvrsenja >= :todayA and datum_izvrsenja <= :todayB', :todayA  => playlist_time - 5*60, :todayB => playlist_time + 5*60).order(:datum_izvrsenja).first

			if @p.blank? then
				@p = Playlist.all.first
			end
			@zapis2 = Track.find(@p.sadrzi_zapis[0].id_zapis)

		else
			@zapis2 = Track.find(@p.sadrzi_zapis[i%count].id_zapis)
		end

		data = Array[@zapis1.name, @zapis1.author, @zapis2.name, @zapis2.author]
		puts data
		return data

	end
end
