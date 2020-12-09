module ApplicationHelper
  def allowed_to_event?(event)
    current_user.id == event.user_id
  end

  def all_tz
    ActiveSupport::TimeZone.all
  end
end
