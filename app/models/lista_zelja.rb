class ListaZelja < ActiveRecord::Base
	has_many :cuva_zapis, :foreign_key => "id_lista"


	def self.new_list(id)
		lista_zelja = ListaZelja.new(:id_korisnik => id)
		lista_zelja.save
		lista_zelja
	end
end
