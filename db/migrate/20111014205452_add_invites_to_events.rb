class AddInvitesToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :invites, :string
  end

  def self.down
    remove_column :events, :invites
  end
end
