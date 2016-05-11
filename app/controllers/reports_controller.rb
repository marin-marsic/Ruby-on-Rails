class ReportsController < ApplicationController

	def show
	end

	def reproduced
		map = Hash.new(0)
		playliste = Playlist.where("izvrsen > 0")
 		playliste.each { |playlist|
 			playlist.sadrzi_zapis.each {|zapis| 
               map[Track.find(zapis.id_zapis)] += 1*playlist.izvrsen
 			}
		}

		@reproducirani = Hash[map.sort_by { |k, v| v }.reverse]
	end

	def prefered
		@urednici = User.urednici
	end

	def prefered_show
        map = Hash.new(0)
        playliste = Playlist.where("izvrsen > 0 and id_korisnik = :id", :id => params[:id])
        playliste.each { |playlist|
 			playlist.sadrzi_zapis.each {|zapis| 
               map[Track.find(zapis.id_zapis)] += 1*playlist.izvrsen
 			}
		}
        @urednik = User.find(params[:id])
		@prefered = Hash[map.sort_by { |k, v| v }.reverse]
	end

	def freq
	end

	def freq_show
		@date_start = params["date_start"].map{|k,v| v}.join("-").to_date.beginning_of_day
		@date_end = params["date_end"].map{|k,v| v}.join("-").to_date.end_of_day
		if @date_start > @date_end then
			flash[:danger] = "Početni datum ne može biti stariji od krajnjeg."
			redirect_to action: "freq"
		end

		tracks = Hash.new(0)
		listezelja = ListaZelja.where("potvrden = 1 and potvrden_at between ? and ?", @date_start, @date_end).limit(10)
		listezelja.each { |lista|
			if lista.potvrden then
				lista.cuva_zapis.find_each { |zapis|
					tracks[Track.find(zapis.id_zapis)] +=1
				}
			end
		}
		zelje = Hash[tracks.sort_by { |k, v | v}.reverse]
		@key, @value = zelje.first
	end

end
