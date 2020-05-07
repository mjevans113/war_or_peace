class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    number_of_cards = 0
    high_ranking_cards = 0
    cards.each do |card|
      number_of_cards += 1
      if card.rank >= 11
        high_ranking_cards += 1
      end
    end
    percent_high_ranking = ( high_ranking_cards.to_f / number_of_cards.to_f ) * 100
    if percent_high_ranking.nan?
      percent_high_ranking = 0.00
    else
      percent_high_ranking.round(2)
    end
  end

  def remove_card
    cards.shift
    cards
  end

  def add_card(card)
    cards << card
  end
end
