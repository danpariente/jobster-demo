class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.text :body
      t.integer :author_id
      t.integer :message_id

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
