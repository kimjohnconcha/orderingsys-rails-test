class RenameTypeToShoetype < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :type, :shoetype
  end
end
