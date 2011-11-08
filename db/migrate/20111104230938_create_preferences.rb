class CreatePreferences < ActiveRecord::Migration
  def self.up
    create_table :preferences do |t|
      t.text :job_titles
      t.string :job_type
      t.string :job_categories
      t.string :expected_salary
      t.boolean :able_to_travel
      t.boolean :able_to_relocate
      t.string :preferred_location
      t.boolean :shift
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :preferences
  end
end
