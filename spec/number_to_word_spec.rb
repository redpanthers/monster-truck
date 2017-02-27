require 'spec_helper'
require 'number_to_word'

RSpec.describe NumberToWord do
  it 'Returns correct values for provided inputs' do
    expect(NumberToWord.call(6_686_787_825)).to(eq(
                                                   [%w(motor usual), %w(noun struck), %w(nouns truck), %w(nouns usual),
                                                    %w(onto struck), 'motortruck']
    ))

    expect(NumberToWord.call(2_282_668_687)).to(eq([%w(act amounts), %w(act contour), %w(acta mounts), %w(bat amounts),
                                                     %w(bat contour), %w(cat contour), 'catamounts']))
  end
end
