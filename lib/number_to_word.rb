require 'bundler'
Bundler.require
require 'dict_builder'

class NumberToWord
  attr_reader :number

  def initialize(number)
    @number = number
  end

  # Public interface to NumberToWord,Delegate functionality to instance method
  def self.call(*args)
    new(*args).call
  end

  # Convert number into set of all possible text representation
  # @return [Array] text representation
  def call
    results = number_combinations.map do |combination|
      [dictionary[combination[0]], dictionary[combination[1]]]
    end
    results = results.reject { |list| list.any?(&:nil?) }.flat_map { |first, second| first.product(second) }

    full_words = dictionary[number.to_s]
    results =  results.reject { |first, second| full_words.include? (first + second) }
    results += full_words if full_words

    results
  end

  private

  # Build dictionary
  # @return [Hash] In memmory hash with number as key and corresponding represntaton as value
  def dictionary
    @@_dictionary ||= ::DictBuilder.call
  end

  # Get all possible subwords with atleast 3 character length
  # @retun [Array] subwords
  def number_combinations
    (0..4).map { |i| [number.to_s[0..i + 2], number.to_s[i + 3..-1]] }
  end
end
