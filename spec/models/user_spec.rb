RSpec.describe User, type: :model do
  let :attributes do
    FactoryBot.attributes_for(:user)
  end

  let :invalid_attributes do
    FactoryBot.attributes_for(
      :user,
      income_cents: nil
    )
  end

  context 'valid user attributes' do
    subject :create! do
      User.create!(attributes)
    end

    it 'creates a user' do
      expect { create! }
        .to change(described_class, :count).by(1)
    end
  end

  context 'invalid user attributes' do
    it 'doesn\'t create a user' do
      expect { User.create!(invalid_attributes) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
