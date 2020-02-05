class AddDetailsToCusts1 < ActiveRecord::Migration[5.0]
  def change
    add_index :custs, :email,unique: true
    #Ex:- add_index("admin_users", "usernam e")
  end
end
