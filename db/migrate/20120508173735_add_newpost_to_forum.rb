class AddNewpostToForum < ActiveRecord::Migration
  def change
    add_column :forums, :newpost, :datetime

  end
end
