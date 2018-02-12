class AddOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
