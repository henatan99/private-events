class RemoveEventIdFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendances, :event_id, :integer
  end
end
