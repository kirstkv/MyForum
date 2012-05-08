class AddTimezoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :time_zone, :string, :default => "London"

  end
end
