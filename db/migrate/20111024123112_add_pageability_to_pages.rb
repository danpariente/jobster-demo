class AddPageabilityToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :pageable_id, :integer
    add_column :pages, :pageable_type, :string
  end

  def self.down
    remove_column :pages, :pageable_type
    remove_column :pages, :pageable_id
  end
end
