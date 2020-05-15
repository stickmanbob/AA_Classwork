class CreateCollections < ActiveRecord::Migration[5.2]
    def change
        create_table :collections do |t|
            t.string :title, null: false
            t.integer :collector_id, null: false
            t.timestamps
        end

        add_index :collections, :collector_id
    end
end
