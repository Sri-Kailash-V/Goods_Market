class CreateMproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :mproducts,id: false do |t|
      t.integer :pid
      t.primary_key :pid
      t.string :product_name,:null => false
      #Ex:- :null => false
      t.references :mfr, foreign_key: {on_delete: :cascade}
      t.integer :quantity,:null => false
      t.integer :price,:null => false
      t.integer :ratings
      t.integer :rcount
      t.timestamps
    end
  end
end
