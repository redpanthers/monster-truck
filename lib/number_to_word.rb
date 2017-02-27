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
    # Implement app logic here
  end

  private

  def dictionary_path
    File.expand_path('../../data/dictionary.txt', __FILE__)
  end
end
