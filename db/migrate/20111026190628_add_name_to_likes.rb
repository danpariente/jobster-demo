class AddNameToLikes < ActiveRecord::Migration
  def self.up
    add_column :likes, :author, :string
  end

  def self.down
    remove_column :likes, :author
  end
end
