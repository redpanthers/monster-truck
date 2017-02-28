require 'bundler'
Bundler.require
require 'dict_builder'

class NumberToWord
  attr_accessor :number
  def initialize(number)
    @number = number
  end

  def self.call(*args)
    new(*args).call
  end

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

  def dictionary
    @@_dictionary ||= ::DictBuilder.call
  end

  def number_combinations
    (0..4).map { |i| [@number.to_s[0..i + 2], @number.to_s[i + 3..-1]] }
  end
end
