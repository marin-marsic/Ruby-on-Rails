class CreateListaZeljas < ActiveRecord::Migration
  def change
    create_table :lista_zeljas do |t|
    	t.integer :id_korisnik
    	t.boolean :potvrden
    	t.datetime :potvrden_at
        t.timestamps
    end
  end
end
