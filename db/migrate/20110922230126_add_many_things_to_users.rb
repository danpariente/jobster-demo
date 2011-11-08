class AddManyThingsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :formatted_name, :string, :limit => 255
    add_column :users, :sex, :string, :limit => 6
    add_column :users, :relationship_status, :string
    add_column :users, :provider, :string, :limit => 255
    add_column :users, :identifier, :string, :limit => 255
    add_column :users, :photo_url, :string, :limit => 255
    add_column :users, :location, :string, :limit => 255
    add_column :users, :description, :string, :limit => 255
    add_column :users, :interests, :text
    add_column :users, :education, :text
  end

  def self.down
    remove_column :users, :education
    remove_column :users, :interests
    remove_column :users, :description
    remove_column :users, :location
    remove_column :users, :photo_url
    remove_column :users, :identifier
    remove_column :users, :provider
    remove_column :users, :relationship_status
    remove_column :users, :sex
    remove_column :users, :formatted_name
  end
end
