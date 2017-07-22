class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.references :album
      t.string :slug, null: false
      t.integer :track_number, null: false
      t.text :lyrics, null: false, default: ''
      t.text :credits, null: false, default: ''
      t.string :title, null: false
      t.string :audio_file
      t.timestamps
    end
  end
end
