class AddGroupToMproducts < ActiveRecord::Migration[5.0]
  def change
    add_column :mproducts, :group, :string
  end
end
