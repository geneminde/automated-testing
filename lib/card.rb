
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
    return "#{value} of #{suit.to_s}"
  end

end
