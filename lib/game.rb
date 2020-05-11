class Game
  attr_reader :player1,
              :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    start_game = gets.chomp

    if start_game.upcase == 'GO'
      play_game
    else
      p "I guess you don't want to play War (or Peace). Your loss."
    end
  end

  def play_game
    turn = Turn.new(@player1, @player2)

    (1..1000000).each do |index|

      winner = turn.winner

      if @player1.has_lost? || @player2.has_lost?
        p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
        break
      elsif turn.type == :player1_loss
        p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif turn.type == :player2_loss
        p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      elsif turn.type == :mutually_assured_destruction
        p "Turn #{index}: *mutually assured destruction* 6 cards removed from play."
      elsif turn.type == :war
        p "Turn #{index}: WAR - #{winner.name} won 6 cards."
      elsif turn.type == :basic
        p "Turn #{index}: #{winner.name} won 2 cards."
      end

      turn.pile_cards
      turn.award_spoils(winner)

      if index == 1000000
        p "---- DRAW ----"
      end
    end
  end
end
