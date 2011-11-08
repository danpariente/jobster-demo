class AddUserstatusidsToMentions < ActiveRecord::Migration
  def self.up
    add_column :mentions, :user_id, :integer
    add_column :mentions, :status_id, :integer
  end

  def self.down
    remove_column :mentions, :status_id
    remove_column :mentions, :user_id
  end
end
