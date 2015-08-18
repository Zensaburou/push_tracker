class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :category_id, null: false
      t.text :description
      t.timestamps
    end

    add_index :events, :category_id
  end
end
