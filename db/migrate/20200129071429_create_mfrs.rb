class CreateMfrs < ActiveRecord::Migration[5.0]
  def change
    create_table :mfrs, id: false do |t|
      t.string :username
      t.string :email
      t.primary_key :email
      t.string :password
      t.integer :mobile_no

      t.timestamps
    end
  end
end
