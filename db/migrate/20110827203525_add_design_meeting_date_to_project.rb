class AddDesignMeetingDateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :design_meeting_date, :date
  end
end
