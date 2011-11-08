class AddUserecipientidsToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :user_id, :integer
    add_column :statuses, :recipient_id, :integer
  end

  def self.down
    remove_column :statuses, :recipient_id
    remove_column :statuses, :user_id
  end
end
