class AddEventIdToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendances, :event, null: false, foreign_key: true
  end
end
