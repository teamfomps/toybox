class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.string :name, null: false
      t.string :slug, null: false, unique: true
      t.string :picture
      t.string :short_description, null: false, default: ''
      t.text :long_description, null: false, default: ''
      t.integer :price_in_pennies, null: false, default: 1500
      t.boolean :for_sale
      t.boolean :published
      t.timestamps
    end
  end
end
