RSpec.describe Couples::Reckoner do
  let :users do
    [
      FactoryBot.create(
        :user,
        full_name: 'Joe Americano',
        income_cents: 50_000_00
      ),
      FactoryBot.create(
        :user,
        full_name: 'Jane Americana',
        income_cents: 60_000_00
      )
    ]
  end

  describe '#perform' do
    subject :perform do
      described_class.new(users).perform
    end

    context 'with valid percentage' do
      it 'returns correct percentage' do
        expect(subject).to eq(
          [
            96,
            'Enjoy DINKing while you can! Live, laugh and love.'
          ]
        )
      end
    end
  end
end
