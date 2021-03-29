require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'

card_1 = Card.new('What does 職場 mean?', 'workplace', :vocab)
card_2 = Card.new('What does 観光 mean?', 'tourism', :vocab)
card_3 = Card.new('What is the kanji for "decorate?"', '飾', :kanji)
card_4 = Card.new('What is the national sport of Japan?', 'sumo', :culture)

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
game = Game.new(round)

game.start