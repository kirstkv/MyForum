class AddSubjectIdToForum < ActiveRecord::Migration
  def change
    add_column :forums, :subject_id, :integer
  end
end
