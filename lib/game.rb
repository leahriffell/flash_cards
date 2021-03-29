class Game
  def initialize(round)
    @round = round
  end

  def start
    puts "Welcome! You're playing with #{@round.deck.cards.size} cards.\n
    -------------------------------------------------\n
    This is card number #{@round.turns.size+1} out of #{@round.deck.cards.size}."
    quiz_through_deck
  end

  def quiz_through_deck
    @round.deck.cards.size.times do
      puts "Question: #{@round.current_card.question}"
      guess = gets.chomp
      @round.take_turn(guess)
      if @round.turns.size < @round.deck.cards.size
        puts "#{@round.turns.last.feedback}\nThis is card number #{@round.turns.size + 1} out of #{@round.deck.cards.size}."
      else
        puts "#{@round.turns.last.feedback}"
        display_final_results
      end
    end
  end

  def display_final_results
    puts "****** Game over! ******\n
    You had #{@round.number_correct} correct guesses out of #{@round.deck.cards.size} for a total score of #{@round.percent_correct}%."
    @round.deck.categories_in_deck.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end