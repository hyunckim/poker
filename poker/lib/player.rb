class Player

  attr_reader :hand, :bankroll, :deck

  def initialize(bankroll)
    @bankroll = bankroll
    @folded = false
  end

  def self.buy_in(bankroll)
    Player.new(bankroll)
  end

  def deal_in(hand)
    @hand = hand
  end

  def take_bet(bet_amt)
    raise 'not enough money' if bet_amt > @bankroll
    @bankroll -= bet_amt
    bet_amt
  end

  def receive_winnings(bet_amt)
    @bankroll += bet_amt
  end

  def return_cards
    cards = @hand.cards
    @hand = nil
    cards
  end

  def fold
    @folded = true
  end

  def unfold
    @folded = false
  end

  def folded?
    @bankroll <= 0 || @folded 
  end

end
