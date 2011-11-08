class AddForeignkeysToDeclines < ActiveRecord::Migration
  def self.up
    add_column :declines, :user_id, :integer
    add_column :declines, :event_id, :integer
  end

  def self.down
    remove_column :declines, :event_id
    remove_column :declines, :user_id
  end
end
