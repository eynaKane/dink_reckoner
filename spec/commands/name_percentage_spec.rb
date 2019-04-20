RSpec.describe Couples::NamePercentage do
  let :full_names do
    [
      'Joe Americano',
      'Jane Americana'
    ]
  end

  describe '#perform' do
    subject :perform do
      described_class.new(full_names).perform
    end

    context 'with valid full_names' do
      it 'returns correct percentage' do
        expect(subject).to eq(46)
      end
    end
  end
end
