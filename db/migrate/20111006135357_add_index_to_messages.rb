class AddIndexToMessages < ActiveRecord::Migration
  def self.up
    #add_index :messages, :user_id
    #add_index :messages, :recipient_id
  end

  def self.down
    #remove_index :messages, :recipient_id
    #remove_index :messages, :user_id
  end
end
