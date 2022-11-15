class CreateEventAttendance < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.belongs_to :event, foreign_key: { to_table: :events }
      t.belongs_to :attendee, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
