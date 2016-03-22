require 'spec_helper'

describe CombinationExtractor do
  it 'has a version number' do
    expect(CombinationExtractor::VERSION).not_to be nil
  end

  describe '#extract' do
    let(:sample) { nil }
    subject { CombinationExtractor.extract(sample) }

    context 'with nil object' do
      it 'returns nil' do
        expect(sample).to be_nil
        expect(subject).to be_nil
      end
    end

    context 'with hash' do
      let(:sample) {
        {
          fruit: %w(apple orange),
          city: %w(NewYork London Tokyo)
        }
      }

      it 'returns valid result' do
        expected_result =
          [
            {fruit: 'apple', city: 'NewYork'},
            {fruit: 'apple', city: 'London'},
            {fruit: 'apple', city: 'Tokyo'},
            {fruit: 'orange', city: 'NewYork'},
            {fruit: 'orange', city: 'London'},
            {fruit: 'orange', city: 'Tokyo'}
          ]
        expect(subject).to eq(expected_result)
      end
    end
  end
end
