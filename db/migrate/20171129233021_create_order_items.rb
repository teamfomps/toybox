class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.string :stripe_sku
      t.integer :quantity
      t.references :order
      t.timestamps
    end
  end
end
