require 'rails_helper'

RSpec.describe ReckonerController, type: :controller do
  let(:user1) do
    FactoryBot.attributes_for(:user)
  end

  let(:user2) do
    FactoryBot.attributes_for(:user)
  end

  let(:invalid_user2) do
    FactoryBot.attributes_for(
      :user,
      income_cents: nil
    )
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Couple' do
        expect do
          post :create, params: { couple: [user1, user2] }
        end.to change(User, :count).by(2)
      end

      it 'renders a JSON response with the new couple' do
        post :create, params: { couple: [user1, user2] }
        expect(response.body).to include('dink_reckoner')
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new couple' do
        post :create, params: { couple: [user1, invalid_user2] }
        expect(response.body).to include('Validation failed')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid number of users' do
      it 'renders a JSON response with errors for the new couple' do
        post :create, params: { couple: [user1, user2, user2] }
        expect(response.body).to include('Only double income is allowed!')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
