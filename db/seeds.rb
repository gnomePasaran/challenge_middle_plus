# frozen_string_literal: true

require 'factory_bot_rails'

ActiveRecord::Base.transaction do
  FactoryBot.create(:user, name: 'Name', email: 'admin@example.com', password: 123456) unless Rails.env.production?

  ['Внутренний митап', 'Публичный митап', 'Прогон доклада', 'Выступление на конференции', 'Хакатон'].each do |title|
    FactoryBot.create :event_type, title: title
  end
end
