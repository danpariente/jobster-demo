class AddForeignkeysToConfirms < ActiveRecord::Migration
  def self.up
    add_column :confirms, :user_id, :integer
    add_column :confirms, :event_id, :integer
  end

  def self.down
    remove_column :confirms, :event_id
    remove_column :confirms, :user_id
  end
end
