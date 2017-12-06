class AddDownloadLinkToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :digital_download_url, :string
  end
end
