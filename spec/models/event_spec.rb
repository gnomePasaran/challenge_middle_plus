require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { build(:event) }

  it { is_expected.to belong_to(:event_type) }
  it { is_expected.to belong_to(:user) }

  describe 'validations' do
    it { is_expected.to be_valid }

    describe '#event_date' do
      subject { build(:event, date: Date.current) }

      it { is_expected.to be_invalid }
    end

    describe '#event_intersection' do
      subject { build(:event, user: old_event.user) }

      let!(:old_event) { create(:event ) }

      it { is_expected.to be_invalid }
    end
  end
end
