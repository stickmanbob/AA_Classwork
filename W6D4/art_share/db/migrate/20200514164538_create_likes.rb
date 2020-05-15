class CreateLikes < ActiveRecord::Migration[5.2]
    def change
        create_table :likes do |t|
            t.integer :liker_id, null: false
            t.references :liked_media, polymorphic: true, null: false
            t.timestamps
        end

        add_index :likes, [:liker_id, :liked_media_id, :liked_media_type], unique: true
    end
end
