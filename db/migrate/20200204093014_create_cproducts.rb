class CreateCproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cproducts,id: false do |t|
      t.integer :pid
      t.primary_key :pid
      t.string :pname
      # t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
