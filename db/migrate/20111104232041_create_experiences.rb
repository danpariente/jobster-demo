class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
      t.string :company_name
      t.string :country
      t.string :industry
      t.date :hired_from
      t.date :hired_to
      t.string :job_title
      t.text :responsability
      t.text :reason_leaving
      t.string :salary
      t.text :add_notes
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :experiences
  end
end
