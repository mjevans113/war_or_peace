require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < MiniTest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards_with_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal :diamond, deck.cards[0].suit
    assert_equal 'Queen', deck.cards[0].value
    assert_equal 12, deck.cards[0].rank

    assert_equal :spade, deck.cards[1].suit
    assert_equal '3', deck.cards[1].value
    assert_equal 3, deck.cards[1].rank

    assert_equal :heart, deck.cards[2].suit
    assert_equal 'Ace', deck.cards[2].value
    assert_equal 14, deck.cards[2].rank
  end

  def test_is_rank_of_card_correct
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 3, deck.rank_of_card_at(1)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_are_high_ranking_cards_correct
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [cards[0], cards[2]], deck.high_ranking_cards
  end

  def test_is_high_ranking_percent_correct
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking

    deck.remove_card

    assert_equal 50.00, deck.percent_high_ranking

    deck.remove_card

    assert_equal 100.00, deck.percent_high_ranking

    deck.remove_card

    assert_equal 0.00, deck.percent_high_ranking
  end

  def test_is_card_added_to_end
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    card4 = Card.new(:club, '7', 7)

    assert_equal cards, deck.add_card(card4)
  end

  def test_is_top_card_removed
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [cards[1], cards[2]], deck.remove_card
  end
end
