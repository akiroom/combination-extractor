
module CombinationExtractor
  VERSION = '0.9.1'.freeze

  # Exctract keyed patterns hash to combination keyed hash.
  # @param key_to_pattern key: title for values, value: [Array] various value to use making combination.
  # @retun [Array] Combination keyed hash.
  # @example
  #   CombinationExtractor.extract({fruit: ['apple', 'orange'], city: ['NewYork', 'London', 'Tokyo']})
  #   => [{:fruit=>"apple", :city=>"NewYork"}, {:fruit=>"apple", :city=>"London"}, {:fruit=>"apple", :city=>"Tokyo"},
  #       {:fruit=>"orange", :city=>"NewYork"}, {:fruit=>"orange", :city=>"London"}, {:fruit=>"orange", :city=>"Tokyo"}]
  def self.extract(key_to_pattern)
    return nil unless key_to_pattern
    extracted = [nil].product(*key_to_pattern.values)
    extracted.map do |pattern|
      pattern.shift
      Hash[key_to_pattern.keys.zip(pattern)]
    end
  end

  # Generate a name from combination
  # @param combination[Hash] based combination
  # @return [String] the name of combination
  def self.name_for(combination)
    return nil unless combination
    combination.map { |k, v| "#{k}=#{v.inspect}" }.join(', ')
  end
end
