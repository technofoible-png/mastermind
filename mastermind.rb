class Mastermind
  def initialize
    @player1 = Player.new('Player 1')

    @current_player = @player1

    @current_secret = @current_player.make_secret
  end

  def play
    puts "Starting new game."
    loop do
      @guess = @current_player.ask_for_guess
      break if check_game_over(@guess)
    end
  end

  # check game over
  def check_game_over(guess)
    if guess == @current_secret
      puts "You win!"
      return TRUE
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
    secret = "1234"
  end

  # make_guess
  def ask_for_guess
    puts "#{self.name} make a guess?" 
    guess = self.make_guess
    if valid_guess(guess)
      puts "You guessed #{guess}."
      return guess
    else
      ask_for_guess
    end
  end

  def make_guess
    guess = gets.chomp
  end

  def valid_guess(guess)
    if /[0-9]{4}/ =~ guess
      return guess
    else
      puts "Invalid guess, guess again."
    end
  end
end

new_game = Mastermind.new
new_game.play