# frozen_string_literal: true

class Mastermind
  def initialize
    @player1 = Player.new('Player 1')

    @current_player = @player1

    @current_secret = @current_player.make_secret
  end

  def play
    puts 'Starting new game.'
    loop do
      @guess = @current_player.ask_for_guess
      make_hint(@guess)
      break if check_game_over(@guess)
    end
  end

  def check_game_over(guess)
    if guess == @current_secret
      puts 'You win!'
      TRUE
    else
      puts 'Guess again.'
    end
  end

  def make_hint(guess)
    puts "Bulls: #{check_bulls(guess)}"
    puts "Cows: #{check_cows(guess)}"
  end

  def check_bulls(guess)
    guess_array = guess.chars.map(&:to_i)
    secret_array = @current_secret.chars.map(&:to_i)

    guess_array.each_with_index.reduce(0) do |bulls, (ele, index)|
      bulls += 1 if ele == secret_array[index]
      bulls
    end
  end

  def check_cows(guess)
    guess_array = guess.chars.map(&:to_i)
    secret_array = @current_secret.chars.map(&:to_i)

    secret_array.reduce(0) do |cows, ele|
      cows += 1 if guess_array.include?(ele)
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
    secret.join
  end

  def ask_for_guess
    puts "#{name} make a guess?"
    guess = make_guess
    if valid_guess(guess)
      puts "You guessed #{guess}."
      guess
    else
      ask_for_guess
    end
  end

  def make_guess
    guess = gets.chomp
  end

  def valid_guess(guess)
    if /[0-9]{4}/ =~ guess
      guess
    else
      puts 'Invalid guess, guess again.'
    end
  end
end

new_game = Mastermind.new
new_game.play
