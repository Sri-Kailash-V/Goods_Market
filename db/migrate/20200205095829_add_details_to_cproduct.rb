class AddDetailsToCproduct < ActiveRecord::Migration[5.0]
  def up
    add_column :cproducts, :status, :string,:default => "Cart"
    #Ex:- :default =>''
  end
end
