class CreateTracks< ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :author
      t.string :company
      t.string :path
      t.string :format
      t.string :frekvencija
      t.string :bitovi_kvant
      t.string :zanr
      t.string :vrsta_nosaca
      t.string :godina_izdanja
      t.string :path
      t.integer :minute, default:0
      t.integer :sekunde, default:0
      t.timestamps;
    end
  end
end
