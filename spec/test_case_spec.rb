require 'poker'
require 'hand'

describe Poker do

  it "Input: '2H 2D 2C KC QD' | Response: 'three of a kind'" do
    hand = Hand.new('2H 2D 2C KC QD')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('6. three of a kind')
  end

  it "Input: '2H 5H 7D 8C 9S' | Response: 'high card'" do
    hand = Hand.new('2H 5H 7D 8C 9S')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('9. high card')
  end

  it "Input: 'AH 2D 3C 4C 5D' | Response: 'straight'" do
    hand = Hand.new('AH 2D 3C 4C 5D')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('5. straight')
  end

  it "Input: '2H 3H 2D 3C 3D' | Response: 'full house'" do
    hand = Hand.new('2H 3H 2D 3C 3D')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('3. full house')
  end

  it "Input: '2H 7H 2D 3C 3D' | Response: 'two pair'" do
    hand = Hand.new('2H 7H 2D 3C 3D')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('7. two pair')
  end

  it "Input: '2H 7H 7D 7C 7S' | Response: 'four of a kind'" do
    hand = Hand.new('2H 7H 7D 7C 7S')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('2. four of a kind')
  end

  it "Input: '10H JH QH KH AH' | Response: 'straight flush'" do
    hand = Hand.new('10H JH QH KH AH')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('1. straight flush')
  end

  it "Input: '4H 4S KS 5D 10S' | Response: 'one pair'" do
    hand = Hand.new('4H 4S KS 5D 10S')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('8. one pair')
  end

  it "Input: 'QC 10C 7C 6C QC' | Response: 'invalid hand'" do
    hand = Hand.new('QC 10C 7C 6C QC')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('invalid hand: duplicate cards')
  end

  it "Input: 'JH QH KH' | Response: 'invalid hand'" do
    hand = Hand.new('JH QH KH')
    poker = Poker.new(hand)

    expect(poker.rank_hand).to eq('invalid hand: not enough cards')
  end

end
