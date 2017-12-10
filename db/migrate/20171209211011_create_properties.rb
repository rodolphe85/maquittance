class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :rent
      t.string :charges
      t.references :landlord, foreign_key: true

      t.timestamps
    end
  end
end
