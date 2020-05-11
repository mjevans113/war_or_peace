require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

cards = CardGenerator.new.generate_cards

cards = cards.shuffle

cards1 = cards.pop(26)

cards2 = cards

deck1 = Deck.new(cards1)

deck2 = Deck.new(cards2)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

war_game = Game.new(player1, player2)
war_game.start
