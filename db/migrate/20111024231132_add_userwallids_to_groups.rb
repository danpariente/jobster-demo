class AddUserwallidsToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :user_id, :integer
    add_column :groups, :wall_id, :integer
  end

  def self.down
    remove_column :groups, :wall_id
    remove_column :groups, :user_id
  end
end
