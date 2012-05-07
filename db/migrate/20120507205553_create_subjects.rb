class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description
      t.references :forum

      t.timestamps
    end
    add_index :subjects, :forum_id
  end
end
