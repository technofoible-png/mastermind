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
      make_hint(@guess)
      break if check_game_over(@guess)
    end
  end

  def check_game_over(guess)
    if guess == @current_secret
      puts "You win!"
      return TRUE
    else
      puts "Guess again."
    end
  end

  def make_hint(guess)
    puts 'Bulls: ' + check_bulls(guess).to_s
    puts 'Cows: ' + check_cows(guess).to_s
  end

  def check_bulls(guess)
    # turn secret and guess into array of nums
    guess_array = guess.chars.map do |char| char.to_i; end
    secret_array = @current_secret.chars.map do |char| char.to_i; end

    # loop through guess with index? to see if any element matches
    guess_array.each_with_index.reduce(0) do |bulls, (ele, index)|
      if ele == secret_array[index]
        bulls += 1
      end
      bulls
    end 
  end

  def check_cows(guess)
    guess_array = guess.chars.map do |char| char.to_i; end
    secret_array = @current_secret.chars.map do |char| char.to_i; end

    secret_array.reduce(0) do |cows, ele|
      if guess_array.include?(ele)
        cows += 1
      end
      cows
    end
  end
end

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def make_secret
    nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    secret = []
    4.times { secret.push(nums.shuffle!.pop) }
    return secret.join
  end


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