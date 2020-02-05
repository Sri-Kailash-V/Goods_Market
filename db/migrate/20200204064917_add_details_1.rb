class AddDetails1 < ActiveRecord::Migration[5.0]
  def change
    change_column :mproducts, :ratings, :integer, :default => 0
    change_column :mproducts, :rcount, :integer, :default => 0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
