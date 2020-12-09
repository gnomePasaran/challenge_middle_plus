require 'csv'

class Events::Export
  def call
    ::CSV.generate(headers: true) do |csv|
      csv << headers

      events.find_each do |event|
        csv << [event.title,
                event.user.full_name,
                event.event_type.title,
                event.date,
                event.start_at,
                event.finish_at,
                event.description]
      end
    end
  end

  private

  def events
    Event.includes(:event_type, :user).chronologically
  end

  def headers
    %w[title author event_type_name date start_at finish_at description]
  end
end
