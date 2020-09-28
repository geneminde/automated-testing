require_relative 'test_helper'

describe Deck do
  # Write tests for the Deck class.
  # What should you test?
  # 1.  Expected Behavior
  # 2.  Edge cases
  before do
    @new_deck = Deck.new
  end
  describe "You can create an instance of Deck" do
    it "Can be created" do

      expect(@new_deck).must_be_instance_of Deck
    end

    it "deck contains 52 cards" do
      no_of_cards = @new_deck.cards.length

      expect(no_of_cards).must_equal 52
    end
  end

  describe "Reader method" do
    it "Returns an array of Card instances" do
      card_array = @new_deck.cards

      expect(card_array).must_be_instance_of Array
      card_array.each do |card|
        expect(card).must_be_instance_of Card
      end
    end
  end

  describe "Testing .shuffle" do
    it "Returns an array of Card instances" do

      expect(@new_deck.shuffle).must_be_instance_of Array
    end
  end

  describe "Testing .draw" do
    it "Returns a card from the deck" do
      drawn_card = @new_deck.draw
      expect(drawn_card).must_be_instance_of Card
    end

    it "Deletes the returned card from the deck" do
      initial_count = @new_deck.cards.length
      drawn_card = @new_deck.draw
      final_count = @new_deck.cards.length

      expect(initial_count - final_count).must_equal 1
      expect(@new_deck.cards).wont_include drawn_card
    end
  end

  describe "Testing .count" do
    it "Returns the number of cards remaining in the deck" do
      new_deck_count = @new_deck.count
      5.times do
        @new_deck.draw
      end
      after_draw_count = @new_deck.count

      expect(new_deck_count).must_equal 52
      expect(after_draw_count).must_equal 47
    end
  end
end
