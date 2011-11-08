class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :activity_type
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
