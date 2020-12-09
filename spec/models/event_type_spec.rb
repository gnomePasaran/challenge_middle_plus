require 'rails_helper'

RSpec.describe EventType, type: :model do
  subject { build(:event_type) }

  it { is_expected.to have_many(:events).dependent(:restrict_with_error) }

  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
end
