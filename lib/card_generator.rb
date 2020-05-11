class CardGenerator
  def generate_cards
    card = []
    cards = []
    File.foreach('./lib/cards.txt') do |line|
      card = line.split(',')
      card = [card[0].to_sym, card[1].to_s, card[2].chomp.to_i]
      new_card = Card.new(card[0], card[1], card[2])
      cards << new_card
    end
    cards
  end
end
