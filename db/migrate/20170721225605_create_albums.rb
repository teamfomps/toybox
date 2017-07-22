class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :slug, null: false, unique: true
      t.string :title, null: false
      t.string :short_description, null: false, default: ''
      t.string :long_description, null: false, default: ''
      t.integer :year, null: false, default: 1900
      t.boolean :for_sale, null: false, default: false
      t.boolean :published, null: false, default: true
      t.string :cover_art, null: true
      t.references :category
      t.timestamps
    end
  end
end
