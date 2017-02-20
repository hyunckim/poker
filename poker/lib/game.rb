require 'deck'
require 'player'

class Game

  attr_reader :pot, :deck, :players

  def initialize
    @pot = 0
  end

  def deck
    @deck = Deck.new
  end

  def add_players(num, buy_in)
    @players = []
    num.times do
      @players << Player.buy_in(buy_in)
    end
  end

  def game_over?
    live_players = 0
    @players.each do |player|
      live_players += 1 if player.bankroll > 0
    end
    live_players == 1
  end

  def deal_cards
    @players.each do |player|
      next if player.folded?
      player.deal_in(deck.deal_hand)
    end
  end

  def add_to_pot(amt)
    @pot += amt
  end

end
