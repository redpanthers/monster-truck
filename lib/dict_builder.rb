class DictBuilder
  def self.call(*args)
    new.call(*args)
  end

  def call
    number_to_word = {}
    dictionary.each do |word|
      num = string_to_numbers(word)
      if number_to_word[num]
        number_to_word[num] << word.downcase.chomp
      else
        number_to_word[num] = [word.downcase.chomp]
      end
    end
    number_to_word
  end

  private

  def dictionary
    dictionary_path = File.expand_path('../../data/dictionary.txt', __FILE__)
    File.open(dictionary_path).readlines
  end

  def string_to_numbers(s)
    s.chars.map { |c| char_to_number(c).to_s }.join
  end

  def char_to_number(ch)
    case ch.downcase
    when 'a', 'b', 'c'      then 2
    when 'd', 'e', 'f'      then 3
    when 'g', 'h', 'i'      then 4
    when 'j', 'k', 'l'      then 5
    when 'm', 'n', 'o'      then 6
    when 'p', 'q', 'r', 's' then 7
    when 't', 'u', 'v'      then 8
    when 'w', 'x', 'y', 'z' then 9
    end
  end
end
