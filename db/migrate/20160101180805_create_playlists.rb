class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
    	t.integer :id_korisnik
    	t.datetime :datum_unosa
    	t.datetime :datum_izvrsenja
    	t.integer :izvrsen, default:0
    	t.boolean :potvrden

      t.timestamps null: false
    end
  end
end
