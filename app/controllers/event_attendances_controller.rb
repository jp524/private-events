class EventAttendancesController < ApplicationController
  def create
    @event_attendance = EventAttendance.create(event_attendance_params)
    redirect_to root_path
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:event_id, :attendee_id)
  end
end
