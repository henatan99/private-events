class AddAttendeeIdToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :attendee_id, :integer
  end
end
