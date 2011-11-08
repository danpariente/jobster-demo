class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title, :limit => 255
      t.string :caption, :limit => 255
      t.string :privacy, :default => 'public'
      t.string :format

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
