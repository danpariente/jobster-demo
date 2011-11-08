class AddWallidToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :wall_id, :integer
  end

  def self.down
    remove_column :users, :wall_id
  end
end
