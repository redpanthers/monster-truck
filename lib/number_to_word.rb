require 'bundler'
Bundler.require

class NumberToWord
  attr_accessor :number
  CHAR_MAP = { 2 => %w(A B C),
               3 => %w(D E F),
               4 => %w(G H I),
               5 => %w(J K L),
               6 => %w(M N O),
               7 => %w(P Q R S),
               8 => %w(T U V),
               9 => %w(W X Y Z) }.freeze
  def initialize(number)
    @number = number
    @dictionary = File.open(dictionary_path)
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    number_to_word = {}
    @dictionary.readlines.each do |word|
      num = string_to_numbers(word)
      if number_to_word[num]
        number_to_word[num] << word
      else
        number_to_word[num] = [word]
      end
    end
    number_combinations.map do |combination|
      [number_to_word[combination[0]], number_to_word[combination[1]]].flatten.compact
    end + 
    [
      number_to_word[@number.to_s]
    ]
  end

  private

  def dictionary_path
    File.expand_path('../../data/dictionary.txt', __FILE__)
  end

  def string_to_numbers(s)
    s.chars.map { |c| char_to_number(c).to_s }.join
  end

  def char_to_number(ch)
    case ch.downcase
    when 'a', 'b', 'c' then 2
    when 'd', 'e', 'f'      then 3
    when 'g', 'h', 'i'      then 4
    when 'j', 'k', 'l'      then 5
    when 'm', 'n', 'o' then 6
    when 'p', 'q', 'r', 's' then 7
    when 't', 'u', 'v' then 8
    when 'w', 'x', 'y', 'z' then 9
    end
  end

  def number_combinations
    (0..4).map {|i| [@number.to_s[0..i+2] , @number.to_s[i+3..-1]] }
  end
end
