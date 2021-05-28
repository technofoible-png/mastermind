class Mastermind
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')

    @current_player = @player1

    @current_secret = @current_player.make_secret
  end

  def play
    puts "Starting new game."
    @guess = @current_player.make_guess
    check_game_over(@guess)


  end

  # check game over
  def check_game_over(guess)
    if guess == @current_secret
      puts "You win!"
    else
      puts "Guess again."
    end
  end

  # make_hint
  def make_hint

  end

end

class Player
  # initialize
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # make_secret
  def make_secret
    secret = 1234
  end

  # make_guess
  def make_guess
    puts "#{self.name} make a guess?" 
    guess = gets.chomp.to_i
    puts "You guessed #{guess}."
    return guess
  end
end

new_game = Mastermind.new
new_game.play