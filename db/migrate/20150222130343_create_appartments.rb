class CreateAppartments < ActiveRecord::Migration
  def change
    create_table :appartments do |t|
      t.string :eid, null: false
      t.string :rent_type, null: false
      t.integer :price, null: false
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :url

      t.timestamps null: false
    end

    add_index :appartments, :eid, unique: true
  end
end
