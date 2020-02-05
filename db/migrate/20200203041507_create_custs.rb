class CreateCusts < ActiveRecord::Migration[5.0]
  def change
    create_table :custs do |t|
      t.string :username,:null => false
      t.string :email,unique: true,:null => false
      t.string :password,:null => false
      t.text :address,:null => false
      t.integer :mobile_no,:null => false,length: {is: 10}

      t.timestamps
    end
  end
end
