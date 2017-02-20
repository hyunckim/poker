require_relative './card'
require_relative './hand'

class Deck
  def self.all_cards
    @cards = []
    Card.values.each do |value|
      Card.suits.each do |suit|
        @cards << Card.new(suit, value)
      end
    end
    @cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def deal_hand
    Hand.new(self)
  end

  def count
    @cards.length
  end

  def take(n)
    raise "not enough cards" if n > count
    a = []
    n.times { a << @cards.shift }
    a
  end

  def return(cards)
    @cards.concat(cards)
  end

  def shuffle
    @cards.shuffle!
  end
end
