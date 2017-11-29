class AddSkuToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :sku, :string
    add_column :instruments, :sku, :string
  end
end
