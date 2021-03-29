class CardGenerator
  def initialize(file)
    @file = file
  end

  def cards
    cards = []
    File.readlines(@file).each do |card|
      details = card.split(',')
      cards << Card.new(details[0].strip, details[1].strip, details[2].strip)
    end
    cards
  end
end