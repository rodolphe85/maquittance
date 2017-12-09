class CreateLandlords < ActiveRecord::Migration[5.1]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
