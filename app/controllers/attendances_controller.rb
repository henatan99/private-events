class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
end
