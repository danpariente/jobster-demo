class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.date :date_birth
      t.string :gender
      t.string :marital_status
      t.string :current_drawn
      t.string :availability
      t.string :mobile_number
      t.string :home_number
      t.string :work_number
      t.string :education_level
      t.text :skills
      t.string :image
      
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
