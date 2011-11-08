class AddAttendanceToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :attendance, :string
  end

  def self.down
    remove_column :events, :attendance
  end
end
