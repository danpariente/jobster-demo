class AddForeignkeysToPendings < ActiveRecord::Migration
  def self.up
    add_column :pendings, :user_id, :integer
    add_column :pendings, :event_id, :integer
  end

  def self.down
    remove_column :pendings, :event_id
    remove_column :pendings, :user_id
  end
end
