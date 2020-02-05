class CreateCproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cproducts do |t|
      t.integer :pid
      
      t.string :pname
      # t.integer :price
      t.integer :quantity
      t.references :cust,foreign_key:{on_delete: :cascade}
      t.timestamps
    end
  end
end
