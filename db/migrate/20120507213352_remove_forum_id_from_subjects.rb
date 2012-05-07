class RemoveForumIdFromSubjects < ActiveRecord::Migration
  def up
    remove_column :subjects, :forum_id
  end

  def down
    add_column :subjects, :forum_id, :integer
  end
end
