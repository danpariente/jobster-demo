class AddMemberidToMemberships < ActiveRecord::Migration
  def self.up
    add_column :memberships, :member_id, :integer
  end

  def self.down
    remove_column :memberships, :member_id
  end
end
