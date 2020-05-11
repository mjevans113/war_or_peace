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
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.cards[1].nil? || @player1.deck.cards[2].nil?
      :player1_not_enough_cards_for_war
    elsif @player2.deck.rank_of_card_at(0) == @player1.deck.rank_of_card_at(0) && @player2.deck.cards[1].nil? || @player2.deck.cards[2].nil?
      :player2_not_enough_cards_for_war
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war && @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
      @player1
    elsif type == :war && @player2.deck.cards[2].rank > @player1.deck.cards[2].rank
      @player2
    elsif type == :basic && @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      @player1
    elsif type == :basic && @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
      @player2
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times { @player1.deck.remove_card }
      3.times { @player2.deck.remove_card }
    elsif type == :war
      3.times { |index| @spoils_of_war << @player1.deck.cards[index] }
      3.times { |index| @spoils_of_war << @player2.deck.cards[index] }
      3.times { @player1.deck.remove_card }
      3.times { @player2.deck.remove_card }
    elsif type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.remove_card
      @player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @spoils_of_war.shuffle.each do |card|
        @player1.deck.cards << card
      end
      @spoils_of_war = []
    elsif winner == @player2
      @spoils_of_war.shuffle.each do |card|
        @player2.deck.cards << card
      end
      @spoils_of_war = []
    elsif winner == 'No Winner'
      @spoils_of_war = []
    end
  end
end
