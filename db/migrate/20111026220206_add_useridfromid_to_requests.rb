class AddUseridfromidToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :user_id, :integer
    add_column :requests, :from_id, :integer
  end

  def self.down
    remove_column :requests, :from_id
    remove_column :requests, :user_id
  end
end
