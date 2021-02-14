require 'pry'
class Guess
  #answer --- 4 letters array? rgby(of some type)
  attr_accessor :sorted_answer, :sorted_guess, :number_of_correct_positions,
                :number_correct_elements
  #guess --- 4 letter string? array? rgby
  def initialize(answer, guess)
    @sorted_answer = sort_answer(answer)
    @sorted_guess = sort_guess(guess)
    @number_correct_elements = determine_correct_elements(answer, guess)
    @number_of_correct_positions = 0
  end

  def sort_answer(answer)
    answer_hash = {
      r:[], g:[],
      b:[], y:[]
    }
     #good option for module ---sort module
    answer.each do |letter| #nested iteration bad, find other way at some point
      answer_hash.each do |key, value| #better naming for key, value
        if key.to_s == letter
          answer_hash[key] << letter
        else
          answer_hash[key] << nil
        end
      end
    end
    answer_hash
  end

  def sort_guess(guess)
    guess_hash = {
      r:[], y:[],
      g:[], b:[],
    }
    guess.each do |letter| #nested iteration bad, find other way at some point
      guess_hash.each do |key, value| #better naming for key, value
        if key.to_s == letter
          guess_hash[key] << letter
        else
          guess_hash[key] << nil
        end
      end
    end
  guess_hash
  end

  def determine_correct_elements(answer, guess)
    count = 0
    answer.each do |value|
      if guess.include?(value)
        count += 1
      end
    end
    count
  end

  def determine_number_in_correct_position
    count_red_matches
    count_blue_matches
    count_green_matches
    count_yellow_matches
  end

  def count_red_matches
    formatted_array = @sorted_answer[:r].zip(@sorted_guess[:r])
    formatted_array.each do |indexed_pair|
      if indexed_pair[0] == indexed_pair[1] && indexed_pair[0] != nil
        @number_of_correct_positions += 1
      end
    end
  end

  def count_blue_matches
    formatted_array = @sorted_answer[:b].zip(@sorted_guess[:b])
    formatted_array.each do |indexed_pair|
      if indexed_pair[0] == indexed_pair[1] && indexed_pair[0] != nil
        @number_of_correct_positions += 1
      end
    end
  end

  def count_green_matches
    formatted_array = @sorted_answer[:g].zip(@sorted_guess[:g])
    formatted_array.each do |indexed_pair|
      if indexed_pair[0] == indexed_pair[1] && indexed_pair[0] != nil
        @number_of_correct_positions += 1
      end
    end
  end

  def count_yellow_matches
    formatted_array = @sorted_answer[:y].zip(@sorted_guess[:y])
    formatted_array.each do |indexed_pair|
      if indexed_pair[0] == indexed_pair[1] && indexed_pair[0] != nil
        @number_of_correct_positions += 1
      end
    end
  end


end
