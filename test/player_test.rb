require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < MiniTest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarissa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_deck_of_cards_with_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarissa', deck)

    assert_equal 'Clarissa', player.name

    assert_equal :diamond, player.deck.cards[0].suit
    assert_equal 'Queen', player.deck.cards[0].value
    assert_equal 12, player.deck.cards[0].rank

    assert_equal :spade, player.deck.cards[1].suit
    assert_equal '3', player.deck.cards[1].value
    assert_equal 3, player.deck.cards[1].rank

    assert_equal :heart, player.deck.cards[2].suit
    assert_equal 'Ace', player.deck.cards[2].value
    assert_equal 14, player.deck.cards[2].rank
  end

  def test_it_has_lost_the_game
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarissa', deck)

    player.deck.remove_card

    assert_equal false, player.has_lost?

    player.deck.remove_card

    assert_equal false, player.has_lost?

    player.deck.remove_card

    assert_equal true, player.has_lost?
  end
end
