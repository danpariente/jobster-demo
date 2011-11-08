class CreateCompetencies < ActiveRecord::Migration
  def self.up
    create_table :competencies do |t|
      t.string :name
      t.string :rating
      t.text :description
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :competencies
  end
end
