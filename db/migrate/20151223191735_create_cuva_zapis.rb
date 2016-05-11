class CreateCuvaZapis < ActiveRecord::Migration
  def change
    create_table :cuva_zapis do |t|
    	t.integer :id_lista
    	t.integer :mjesto
    	t.integer :id_zapis 

      t.timestamps null: false
    end
    add_index :cuva_zapis, :id_lista
  end
end
