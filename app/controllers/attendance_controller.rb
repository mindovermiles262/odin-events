class AttendanceController < ApplicationController
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user_id = current_user.id
    if @attendance.save
      flash[:success] = "Joined Event"
      redirect_to events_url
    else
      flash[:danger] = "Unable to Join Event"
      render 'events/show'
    end
  end

  private

  def attendance_params
    params.permit(:event_id)
  end
end
