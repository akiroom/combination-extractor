require 'spec_helper'

describe CombinationExtractor do
  it 'has a version number' do
    expect(CombinationExtractor::VERSION).not_to be nil
  end

  describe '#extract' do
    let(:sample) { nil }
    subject { CombinationExtractor.extract(sample) }

    context 'with nil object' do
      it 'should return nil' do
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

      it 'should return valid result' do
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

    context 'in RSpec example' do
      def example_similar_to(user_hash)
        user_hash[:birthday] == Time.new(1988, 12, 30) &&
          user_hash[:gender] == :male
      end

      describe 'About example example_similar_to method' do

        let(:nickname) { nil }
        let(:gender) { nil }
        let(:birthday) { nil }
        let(:user) { { nickname: nickname, gender: gender, birthday: birthday } }

        user_condition = {
          nickname: ['John', 'Ken', 'Jessie'],
          gender: [:female, :male],
          birthday: [Time.new(1988, 12, 30), Time.now]
        }
        # Get 2*2*3 = 12 patterns
        pattern_list = CombinationExtractor.extract(user_condition)

        pattern_list.each do |pattern|
          describe "user who is #{pattern.to_s}" do
            # NOTE: Set pattern to lazy evaluated variable
            pattern.each { |key, value| let(key) { value } }

            should_value = pattern[:gender] == :male && pattern[:birthday] == Time.new(1988, 12, 30)
            it "should return #{should_value}" do
              expect(example_similar_to(user)).to eq(should_value)
            end
          end
        end
      end
    end
  end
end
