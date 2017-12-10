class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :email
      t.string :phone
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
