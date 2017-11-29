class AddStripeIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :stripe_id, :string
    add_column :instruments, :stripe_id, :string
  end
end
