class AddDateToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :Date, :date
  end
end
