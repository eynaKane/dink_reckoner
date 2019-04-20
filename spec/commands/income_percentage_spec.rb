RSpec.describe Couples::IncomePercentage do
  let :incomes do
    [
      50_000_00,
      60_000_00
    ]
  end

  describe '#perform' do
    subject :perform do
      described_class.new(incomes).perform
    end

    context 'with valid incomes' do
      it 'returns correct percentage' do
        expect(subject).to eq(50)
      end
    end
  end
end
