class AddAttendeeIdToAttendences < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :attendee_id, :integer, index: true
    add_foreign_key :attendances, :events, column: :attendee_id
    
    add_column :attendances, :event_id, :integer, index: true
    add_foreign_key :attendances, :events, column: :event_id
  end
end
