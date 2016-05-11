class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :ime
      t.string :prezime
      t.string :email
      t.string :password_digest
      t.string :remember_digest

      # 1 == admin, 2 == urednik, 3 == obicni korisnik, 4 == vlasniks
      t.integer :uloga, :default => 3
      t.string :string
      t.boolean :activated
      t.string :activation_digest
      t.datetime :activated_at
      t.datetime :termin_urednika, :default => DateTime.new(2016, 01, 01, 00, 00, 0)
      t.datetime :activity
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.timestamps
    end
  end
end
