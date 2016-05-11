class CreateSadrziZapis < ActiveRecord::Migration
  def change
    create_table :sadrzi_zapis do |t|
    	t.integer :id_playlist
    	t.integer :mjesto
    	t.integer :id_zapis

      t.timestamps null: false
    end

    add_index :sadrzi_zapis, :id_playlist
  end
end
