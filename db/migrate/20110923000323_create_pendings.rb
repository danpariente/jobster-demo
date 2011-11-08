class CreatePendings < ActiveRecord::Migration
  def self.up
    create_table :pendings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :pendings
  end
end
