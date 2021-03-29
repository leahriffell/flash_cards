require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'
require './lib/card_generator'

filename = 'cards.txt'

cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)
game = Game.new(round)

game.start