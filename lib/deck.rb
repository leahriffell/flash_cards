class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    cards.find_all { |card| card.category == category }
  end

  def categories_in_deck
    cards.collect { |card| card.category }.uniq
  end
end