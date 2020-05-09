class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    winner = ''
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war && @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
      winner = @player1
    elsif type == :war && @player2.deck.cards[2].rank > @player1.deck.cards[2].rank
      winner = @player2
    elsif type == :basic && @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      winner = @player1
    elsif type == :basic && @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
      winner = @player2
    end
  end
end
