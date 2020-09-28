
# deck.rb

require_relative 'card'

class Deck

  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  SUITS = [:hearts, :spades, :clubs, :diamonds]

  def initialize
    @cards = []

    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  attr_reader :cards

  def draw
    # returns a card
    return cards.shift
  end

  def shuffle
    # shuffles the deck
    return cards.shuffle
  end

  def count
    # returns the number of cards in the deck
    return cards.length
  end
end
