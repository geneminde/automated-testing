require_relative 'test_helper'

describe Card do
  describe "You can create a Card instance" do

    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect {Card.new(0, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :clovers)}.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do

    it "to_s returns a readable String value logically for values 2-10" do
      # Test to ensure that to_s works for cards values 2-10
      # for example:  "2 of diamonds"
      (2..10).each do |i|
        [:diamonds, :hearts, :spades, :clubs].each do |suit|
          card = Card.new(i, suit)
          expect(card.to_s).must_be_instance_of String
        end
      end
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      # Test to ensure that to_s works for cards values 1, and 11-13
      # For example: "Queen of hearts"
      # The current implementation of to_s does not address this feature
      # Write the test, see it fail, then modify to_s to make it pass!
      # (Consider writing a helper method!)
      #
      # For reference:
      #  1: Ace
      #  11: Jack
      #  12: Queen
      #  13: King
      [:hearts, :diamonds, :spades, :clubs].each do |suit|
        [1, 11, 12, 13].each do |value|
          card = Card.new(value, suit)
          case value
          when 1
            expect(card.to_s).must_equal "Ace of #{suit.to_s}"
          when 11
            expect(card.to_s).must_equal "Jack of #{suit.to_s}"
          when 12
            expect(card.to_s).must_equal "Queen of #{suit.to_s}"
          when 13
            expect(card.to_s).must_equal "King of #{suit.to_s}"
          end
        end
      end

    end
  end

  describe "Reader methods" do

    it "Can retrieve the value of the card using a `.value`." do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card.value).must_be_instance_of Integer
          expect(card.value).must_equal value
        end
      end
    end

    it "Can retrieve the value of the card using a `.suit`." do
      # ensure that `.suit works as expected returning the symbol of the suit`
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card.suit).must_be_instance_of Symbol
          expect(card.suit).must_equal suit
        end
      end
    end
  end
end
