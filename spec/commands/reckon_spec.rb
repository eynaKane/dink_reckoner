RSpec.describe Couples::Reckon do
  let :total_percentage do
    90
  end

  describe '#perform' do
    subject :perform do
      described_class.new(total_percentage).perform
    end

    context 'with valid percentage' do
      it 'returns correct percentage' do
        expect(subject).to eq(
          'Enjoy DINKing while you can! Live, laugh and love.'
        )
      end
    end
  end
end
