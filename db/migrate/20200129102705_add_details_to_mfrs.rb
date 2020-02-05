class AddDetailsToMfrs < ActiveRecord::Migration[5.0]
  def change
    add_column :mfrs, :id, :primary_key
    add_column :mfrs, :email, :string
    add_index :mfrs, :email, unique: true
  end
end
