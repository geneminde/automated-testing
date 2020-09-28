
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit

    raise ArgumentError if value <= 0 || value > 13

    until [:hearts, :spades, :clubs, :diamonds].include?(suit)
      raise ArgumentError
    end
  end

  def to_s
    if [1, 11, 12, 13].include?(value)
      return "#{convert_facecard_value} of #{suit.to_s}"
    else
      return "#{value} of #{suit.to_s}"
    end
  end

  private

  def convert_facecard_value
    value_hash = { 1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"}
    return value_hash[value]
  end

end
