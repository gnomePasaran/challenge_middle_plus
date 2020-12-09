class EventPresenter
  attr_reader :event

  delegate :id, :user_id, :title, :date, to: :event

  def initialize(event)
    @event = event
  end

  def author
    event.user.full_name
  end

  def duration
    return '' unless event.event_type.title == 'Хакатон'

    ((event.finish_at - event.start_at) / 3600).ceil
  end
end
