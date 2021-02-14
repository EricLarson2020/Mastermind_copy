require './lib/sequence'
require 'pry'
class GameLoop
  attr_reader :guess, :answer

  def initialize
    @guess = []
    @answer = Sequence.new.correct_answer
    @cheat = @answer.join.upcase
    @game_over = false
    @guess_count = 0
    @start_time
  end

  def play_game
    @start_time = Time.new
    until @game_over == true
      user_guess
    end
  end

  def user_guess
    # start_time = Time.now
    puts "Enter guess here"
    print "> "
    string_guess = gets.chomp.downcase
    @guess = string_guess.split("")

      if string_guess == 'q' || string_guess == 'quit'
        p 'Thanks for playing!'
        @game_over = true
      elsif string_guess == 'c' || string_guess == 'cheat'
        p "'#{@cheat}' is the random sequence."
      elsif string_guess.length == 4
        # @guess = string_guess.split("")

        if valid_guess?(@guess) == false
          p "Invalid response"
        elsif @guess == @answer
          end_time = Time.now
          @guess_count += 1
          minutes = ((end_time - @start_time) / 60).to_i
          seconds = ((end_time - @start_time).to_i) - (minutes * 60)

          puts "Congratulations! You guessed the sequence '#{@cheat}' in #{@guess_count} guesses over #{minutes} minutes and #{seconds} seconds
          Do you want to (p)lay again or (q)uit?"
          print "> "
          winner_statement = gets.chomp.downcase
            if winner_statement == 'q' || winner_statement == 'quit' #break in seperate methods
              puts "Thanks for playing!"
              @game_over = true
            elsif winner_statement == 'p' || winner_statement == 'play'
              @game_over = true
              new_game = GameLoop.new.play_game
            end

        else
          @guess_count += 1

          puts " '#{string_guess.upcase}' has #{compare_correct_amount} of the correct elements with #{compare_amount_in_correct_place}
          in the correct positions"
        end

      elsif string_guess.length > 4
        p 'Answer too long'
      elsif string_guess.length < 4
        p 'Answer too short'
      end
  end

  def compare_amount_in_correct_place
    correct_place = 0

    @guess.zip(@answer).map do |color_guess, correct_color|
      if color_guess == correct_color
        correct_place += 1
      end
    end

     correct_place
  end

  def compare_correct_amount

    #I would probably put this in a guess class
    #That would make the guess functionality much eaisier to test, as you can control
    #what is passed into the code

    #the below is taking up a ton of space making 8-arrays, a better method is to use a hash
    #with keys as the letters, and the values consisting of an array of values

    #I would probably make a cheat class as well using the same concept

    answer_reds= []
    answer_greens = []
    answer_blues = []
    answer_yellows = []

    guess_reds= []
    guess_greens = []
    guess_blues = []
    guess_yellows = []

    number_correct = 0

    binding.pry
    @answer.find_all do |answer|
      if answer == 'r'
        answer_reds << answer
      elsif answer == 'g'
        answer_greens << answer
      elsif answer == 'b'
        answer_blues << answer
      elsif answer == 'y'
        answer_yellows << answer
      end
    end

    @guess.find_all do |guess|
      if guess == 'r'
        guess_reds << guess
      elsif guess == 'g'
        guess_greens << guess
      elsif guess == 'b'
        guess_blues << guess
      elsif guess == 'y'
        guess_yellows << guess
      end
    end

    guess_reds.zip(answer_reds).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end

    guess_greens.zip(answer_greens).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end

    guess_blues.zip(answer_blues).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end

    guess_yellows.zip(answer_yellows).map do |guess_color, answer_color|
      if guess_color == answer_color
        number_correct += 1
      end
    end

    puts "answer: #{@answer}"
    puts "guess: #{@guess}"

     number_correct
  end

  def valid_guess?(guess)
    correct_colors = true
    guess.each do |color|
      if color != 'r' && color != 'b' && color != 'g' && color != 'y'
        correct_colors = false
      end
    end
    correct_colors
  end

  # def winner
  #   if @answer == @guess
  #
  #     puts "Congratulations! You guessed the sequence '#{@cheat}' in guesses over TIME
  #     Do you want to (p)lay again or (q)uit?"
  #   end
  # end
  # def correct_amount
  #   correct = (@guess & @answer)
  #   puts "correct: #{correct.length}"
  # end
end
# game = GameLoop.new.play_game

#require "pry";binding.pry
