require 'spec_helper'
require 'number_to_word'

RSpec.describe NumberToWord do
  it 'Converts 6_686_787_825' do
    expected_result = [%w(motor usual), %w(noun struck), %w(nouns truck), %w(nouns usual),
                       %w(onto struck), 'motortruck']

    expect(NumberToWord.call(6_686_787_825)).to(match_array(expected_result))
  end

  it 'Converts 2_282_668_687' do
    expected_result = [%w(act amounts), %w(act contour), %w(acta mounts), %w(bat amounts),
                       %w(bat contour), %w(cat contour), 'catamounts']
    expect(NumberToWord.call(2_282_668_687)).to(match_array(expected_result))
  end
end
