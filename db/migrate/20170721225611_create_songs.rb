class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.references :albums
      t.string :slug, null: false
      t.integer :track_number, null: false
      t.text :lyrics, null: false, default: ''
      t.text :credits, null: false, default: ''
      t.string :audio_file
      t.timestamps
    end
  end
end
