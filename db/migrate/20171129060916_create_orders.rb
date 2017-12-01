class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :stripe_id, unique: true
      t.timestamps
    end
  end
end
