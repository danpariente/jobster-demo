class CreateDeclines < ActiveRecord::Migration
  def self.up
    create_table :declines do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :declines
  end
end
