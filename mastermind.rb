class Mastermind
  def initialize
    secret_code = 1234
  end

  def begin_game
    puts "Starting new game."
    puts "Make a guess?"
    
    guess = gets.chomp.to_i
    puts "You guessed #{guess}."
  end
end

new_game = Mastermind.new
new_game.begin_game