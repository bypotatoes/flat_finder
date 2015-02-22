class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :eid, null: false
      t.string :rent_type, null: false
      t.integer :price, null: false
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :url

      t.timestamps null: false
    end

    add_index :apartments, :eid, unique: true
  end
end
