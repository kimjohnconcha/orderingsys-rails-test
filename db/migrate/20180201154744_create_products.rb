class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image
      t.string :highlights
      t.string :details
      t.string :termsandconditions
      t.string :size

      t.timestamps
    end
  end
end
