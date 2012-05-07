class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.references :topic

      t.timestamps
    end
    add_index :posts, :topic_id
  end
end
