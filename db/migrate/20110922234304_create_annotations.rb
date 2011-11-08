class CreateAnnotations < ActiveRecord::Migration
  def self.up
    create_table :annotations do |t|
      t.text :description
      t.integer :x
      t.integer :y
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end

  def self.down
    drop_table :annotations
  end
end
