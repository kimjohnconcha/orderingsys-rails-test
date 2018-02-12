class AddOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.integer :user_id

      t.timestamps
    end
  end
end
