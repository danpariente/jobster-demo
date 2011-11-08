class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.string :country
      t.string :education_level
      t.string :field_of_study
      t.string :institution
      t.date :attended_from
      t.date :attended_to
      t.text :add_notes
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
