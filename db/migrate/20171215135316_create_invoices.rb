class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :title
      t.date :date
      t.date :from
      t.date :to
      t.text :content
      t.references :property, foreign_key: true
      t.references :tenant, foreign_key: true

      t.timestamps
    end
  end
end
