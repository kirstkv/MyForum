class AddUserIdToForum < ActiveRecord::Migration
  def change
    add_column :forums, :user_id, :integer

  end
end
