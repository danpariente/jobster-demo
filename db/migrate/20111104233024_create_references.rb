class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.string :name
      t.string :relationship
      t.string :email
      t.string :phone_number
      t.string :company_name
      t.string :job_title
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
