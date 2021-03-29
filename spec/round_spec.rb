require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'has turns' do
    expect(@round.turns).to eq([])
  end

  it 'first card in deck starts as the current card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'can create and add turns' do
    new_turn = @round.take_turn('Juneau')
    expect(new_turn).to be_instance_of(Turn)
    expect(@round.turns).to eq([new_turn])

    next_turn = @round.take_turn('Venus')
    expect(next_turn).to be_instance_of(Turn)
    expect(@round.turns).to eq([new_turn, next_turn])
  end

  it 'can increment current card by one after each turn' do
    new_turn = @round.take_turn('Juneau')
    expect(@round.current_card).to eq(@card_2)

    next_turn = @round.take_turn('Venus')
    expect(@round.current_card).to eq(@card_3)
  end

  it 'can keep track of number of correct guesses' do
    expect(@round.number_correct).to eq(0)

    new_turn = @round.take_turn('Juneau')
    expect(@round.number_correct).to eq(1)

    next_turn = @round.take_turn('Venus')
    expect(@round.number_correct).to eq(1)
  end

  it 'can keep track of number of correct guesses by category' do
    expect(@round.number_correct_by_category(:Geography)).to eq(0)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)

    new_turn = @round.take_turn('Juneau')
    expect(@round.number_correct_by_category(:Geography)).to eq(1)

    next_turn = @round.take_turn('Venus')
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'can calculate percentage of correct guesses' do
    expect(@round.percent_correct).to eq(100.0)

    new_turn = @round.take_turn('Juneau')
    expect(@round.percent_correct).to eq(100.0)

    next_turn = @round.take_turn('Venus')
    expect(@round.percent_correct).to eq(50.0)
  end

  it 'can keep track of number of turns with cards of a specific category' do
    expect(@round.number_turns_for_category(:Geography)).to eq(0)
    expect(@round.number_turns_for_category(:STEM)).to eq(0)

    new_turn = @round.take_turn('Juneau')
    expect(@round.number_turns_for_category(:Geography)).to eq(1)

    next_turn = @round.take_turn('Venus')
    expect(@round.number_turns_for_category(:STEM)).to eq(1)
  end

  it 'can calculate percentage of correct guesses by category' do
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.percent_correct_by_category(:STEM)).to eq(100.0)

    new_turn = @round.take_turn('Juneau')
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)

    next_turn = @round.take_turn('Venus')
    expect(@round.percent_correct_by_category(:STEM)).to eq(0.0)
  end
end
