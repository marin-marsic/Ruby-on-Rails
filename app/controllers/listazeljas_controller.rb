class ListazeljasController < ApplicationController
	before_action :load_list

	def index
		if @lista_zelja.potvrden and ((@lista_zelja.potvrden_at).day != Time.now.day)  then
			@lista_zelja = ListaZelja.new_list(current_user.id)
		end
		loadTracks
	end


	def add
		if @lista_zelja.potvrden then
			flash[:info] = "Lista je već potvrđena i ne možete ju mjenjati. Novu će te moći napraviti sutra."
		else
			if @lista_zelja.cuva_zapis.exists?(:id_zapis => params[:track_index]) then
				flash[:danger] = "Izabrani zapis već postoji na listi."
			else

				if @lista_zelja.cuva_zapis.length == 10 then
					flash[:danger] = "Lista želja je već popunjena."
				else
					if @lista_zelja.cuva_zapis.length == 9 then
						flash[:info] = "Ovim zapisom dosegnuta je maksimalna veličina liste želja. Da biste dodali novi zapis izbrišite neki od trenutnih na listi."
					end
					if @lista_zelja.cuva_zapis.empty? then 
						mjesto = 0
					else mjesto = @lista_zelja.cuva_zapis[-1].mjesto + 1
					end
					@lista_zelja.cuva_zapis << CuvaZapi.new(:id_lista => @lista_zelja.id, :mjesto => mjesto, :id_zapis => params[:track_index])
				end
			end
		end
		redirect_to action: 'index'
	end

	def delete
		if @lista_zelja.potvrden then
			flash[:info] = "Lista je već potvrđena i ne možete ju mjenjati. Novu će te moći napraviti sutra."
		else
			@zapis = CuvaZapi.where(:id_zapis => params[:id_delete], :id_lista => @lista_zelja.id).first
			@zapis.destroy
			flash[:info] = "Zapis uspješno izbrisan."
		end
		redirect_to action: 'index'
	end

	def potvrdi
		if @lista_zelja.potvrden then
			flash[:danger] = "Već ste potvrdili listu želja. Novu će te moći napraviti sutra."
		else
			@lista_zelja.potvrden = true
			@lista_zelja.potvrden_at = Time.now
			puts @lista_zelja.potvrden
			@lista_zelja.save
			flash[:info] = "Vaša lista želja je potvrđena. Urednik je obaviješten."
		end
		redirect_to action: 'index'
	end

	def loadTracks
		@pjesmeZelja = []
		@lista_zelja.cuva_zapis.each { |zelja| 
			@pjesmeZelja << Track.find(zelja.id_zapis)
		}
	end

	def load_list
		if ListaZelja.exists?(:id_korisnik => current_user.id) then
			@lista_zelja = ListaZelja.where(:id_korisnik => current_user.id)[-1]
		else
			@lista_zelja = ListaZelja.new(:id_korisnik => current_user.id)
			@lista_zelja.save 
		end
	end
end