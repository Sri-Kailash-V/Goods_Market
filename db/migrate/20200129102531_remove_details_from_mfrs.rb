class RemoveDetailsFromMfrs < ActiveRecord::Migration[5.0]
  def change
    remove_column :mfrs, :id, :primarykey
  end
end
