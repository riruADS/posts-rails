class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.integer :user_id, null: false
      t.boolean :is_private, default: false
      t.index :user_id
      t.timestamps
    end
  end
  
end
