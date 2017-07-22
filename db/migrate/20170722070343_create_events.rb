class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start_time, null: false
      t.string :venue_name, null: false
      t.string :venue_address, null: false
      t.string :venue_city, null: false
      t.string :venue_state, null: false
      t.string :venue_phone, null: false, default: ''
      t.string :venue_url, null: false, default: ''
      t.text :description
      t.boolean :open_to_public
      t.boolean :publish
      t.date :last_day
      t.date :expiration_date
      t.timestamps
    end
  end
end
