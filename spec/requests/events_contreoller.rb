# frozen_string_literal: true

require 'rails_helper'

describe EventsController, type: :request do
  let(:user) { create :user }

  before { sign_in(user) if user }

  describe 'POST events' do
    subject(:perform_request) do
      post '/events.html', params: { title: 'title' }
    end

    context 'when authorized' do
      xit 'creates page' do
        perform_request

        expect(response).to be_ok
        expect(json_response[:title]).to eq 'title'
      end
    end

    context 'when unauthorized' do
    end
  end
end
