class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :title
      t.references :forum

      t.timestamps
    end
    add_index :topics, :forum_id
  end
end
