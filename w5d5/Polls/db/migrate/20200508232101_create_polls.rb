class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
        t.string :title, null: false, uniqueness: true
        t.integer :user_id, null:false 

      t.timestamps
    end
    add_index :polls, :title, unique: true 
    add_index :polls, :user_id
  end
 
end
