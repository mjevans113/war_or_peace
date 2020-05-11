require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

class GameTest < MiniTest::Test
  def test_it_exists
    cards = [card1  = Card.new(:Diamonds, '2', 2),
             card2  = Card.new(:Diamonds, '3', 3),
             card3  = Card.new(:Diamonds, '4', 4),
             card4  = Card.new(:Diamonds, '5', 5),
             card5  = Card.new(:Diamonds, '6', 6),
             card6  = Card.new(:Diamonds, '7', 7),
             card7  = Card.new(:Diamonds, '8', 8),
             card8  = Card.new(:Diamonds, '9', 9),
             card9  = Card.new(:Diamonds, '10', 10),
             card10 = Card.new(:Diamonds, 'Jack', 11),
             card11 = Card.new(:Diamonds, 'Queen', 12),
             card12 = Card.new(:Diamonds, 'King', 13),
             card13 = Card.new(:Diamonds, 'Ace', 14),
             card14 = Card.new(:Clubs, '2', 2),
             card15 = Card.new(:Clubs, '3', 3),
             card16 = Card.new(:Clubs, '4', 4),
             card17 = Card.new(:Clubs, '5', 5),
             card18 = Card.new(:Clubs, '6', 6),
             card19 = Card.new(:Clubs, '7', 7),
             card20 = Card.new(:Clubs, '8', 8),
             card21 = Card.new(:Clubs, '9', 9),
             card22 = Card.new(:Clubs, '10', 10),
             card23 = Card.new(:Clubs, 'Jack', 11),
             card24 = Card.new(:Clubs, 'Queen', 12),
             card25 = Card.new(:Clubs, 'King', 13),
             card26 = Card.new(:Clubs, 'Ace', 14),
             card27 = Card.new(:Hearts, '2', 2),
             card28 = Card.new(:Hearts, '3', 3),
             card29 = Card.new(:Hearts, '4', 4),
             card30 = Card.new(:Hearts, '5', 5),
             card31 = Card.new(:Hearts, '6', 6),
             card32 = Card.new(:Hearts, '7', 7),
             card33 = Card.new(:Hearts, '8', 8),
             card34 = Card.new(:Hearts, '9', 9),
             card35 = Card.new(:Hearts, '10', 10),
             card36 = Card.new(:Hearts, 'Jack', 11),
             card37 = Card.new(:Hearts, 'Queen', 12),
             card38 = Card.new(:Hearts, 'King', 13),
             card39 = Card.new(:Hearts, 'Ace', 14),
             card40 = Card.new(:Spades, '2', 2),
             card41 = Card.new(:Spades, '3', 3),
             card42 = Card.new(:Spades, '4', 4),
             card43 = Card.new(:Spades, '5', 5),
             card44 = Card.new(:Spades, '6', 6),
             card45 = Card.new(:Spades, '7', 7),
             card46 = Card.new(:Spades, '8', 8),
             card47 = Card.new(:Spades, '9', 9),
             card48 = Card.new(:Spades, '10', 10),
             card49 = Card.new(:Spades, 'Jack', 11),
             card50 = Card.new(:Spades, 'Queen', 12),
             card51 = Card.new(:Spades, 'King', 13),
             card52 = Card.new(:Spades, 'Ace', 14)]

    cards = cards.shuffle

    cards1 = cards.pop(26)

    cards2 = cards

    deck1 = Deck.new(cards1)

    deck2 = Deck.new(cards2)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  def test_each_player_starts_with_26_cards
    cards = [card1  = Card.new(:Diamonds, '2', 2),
             card2  = Card.new(:Diamonds, '3', 3),
             card3  = Card.new(:Diamonds, '4', 4),
             card4  = Card.new(:Diamonds, '5', 5),
             card5  = Card.new(:Diamonds, '6', 6),
             card6  = Card.new(:Diamonds, '7', 7),
             card7  = Card.new(:Diamonds, '8', 8),
             card8  = Card.new(:Diamonds, '9', 9),
             card9  = Card.new(:Diamonds, '10', 10),
             card10 = Card.new(:Diamonds, 'Jack', 11),
             card11 = Card.new(:Diamonds, 'Queen', 12),
             card12 = Card.new(:Diamonds, 'King', 13),
             card13 = Card.new(:Diamonds, 'Ace', 14),
             card14 = Card.new(:Clubs, '2', 2),
             card15 = Card.new(:Clubs, '3', 3),
             card16 = Card.new(:Clubs, '4', 4),
             card17 = Card.new(:Clubs, '5', 5),
             card18 = Card.new(:Clubs, '6', 6),
             card19 = Card.new(:Clubs, '7', 7),
             card20 = Card.new(:Clubs, '8', 8),
             card21 = Card.new(:Clubs, '9', 9),
             card22 = Card.new(:Clubs, '10', 10),
             card23 = Card.new(:Clubs, 'Jack', 11),
             card24 = Card.new(:Clubs, 'Queen', 12),
             card25 = Card.new(:Clubs, 'King', 13),
             card26 = Card.new(:Clubs, 'Ace', 14),
             card27 = Card.new(:Hearts, '2', 2),
             card28 = Card.new(:Hearts, '3', 3),
             card29 = Card.new(:Hearts, '4', 4),
             card30 = Card.new(:Hearts, '5', 5),
             card31 = Card.new(:Hearts, '6', 6),
             card32 = Card.new(:Hearts, '7', 7),
             card33 = Card.new(:Hearts, '8', 8),
             card34 = Card.new(:Hearts, '9', 9),
             card35 = Card.new(:Hearts, '10', 10),
             card36 = Card.new(:Hearts, 'Jack', 11),
             card37 = Card.new(:Hearts, 'Queen', 12),
             card38 = Card.new(:Hearts, 'King', 13),
             card39 = Card.new(:Hearts, 'Ace', 14),
             card40 = Card.new(:Spades, '2', 2),
             card41 = Card.new(:Spades, '3', 3),
             card42 = Card.new(:Spades, '4', 4),
             card43 = Card.new(:Spades, '5', 5),
             card44 = Card.new(:Spades, '6', 6),
             card45 = Card.new(:Spades, '7', 7),
             card46 = Card.new(:Spades, '8', 8),
             card47 = Card.new(:Spades, '9', 9),
             card48 = Card.new(:Spades, '10', 10),
             card49 = Card.new(:Spades, 'Jack', 11),
             card50 = Card.new(:Spades, 'Queen', 12),
             card51 = Card.new(:Spades, 'King', 13),
             card52 = Card.new(:Spades, 'Ace', 14)]

    cards = cards.shuffle

    cards1 = cards.pop(26)

    cards2 = cards

    deck1 = Deck.new(cards1)

    deck2 = Deck.new(cards2)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_equal 26, player1.deck.cards.length
    assert_equal 26, player2.deck.cards.length
  end

# I don't know what else to test. Both methods in the Game class initiate the gameplay loop, and the cards in each player's
# deck are randomized and constantly changing. Executing the runner file seems to produce the intended results, though. *shrug*
end
