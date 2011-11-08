class AddUsereventgroupidsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :user_id, :integer
    add_column :pages, :event_id, :integer
    add_column :pages, :group_id, :integer
  end

  def self.down
    remove_column :pages, :group_id
    remove_column :pages, :event_id
    remove_column :pages, :user_id
  end
end
