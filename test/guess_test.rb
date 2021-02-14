require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class TestGuess < Minitest::Test

  def setup
    @guess_1 = Guess.new(['y','y','g','b'], ['y', 'r', 'b', 'g'])
    @guess_2 = Guess.new(['r','r','g','b'], ['r', 'g', 'b', 'b'])
  end

  def test_it_exists
    assert_instance_of Guess, @guess_1
  end

  def test_it_can_create_a_formatted_answer
    formatted_answer = {
      r: [nil, nil, nil, nil],
      y: ['y', 'y', nil, nil],
      g: [nil, nil, 'g', nil],
      b: [nil, nil, nil, 'b']
    }

    assert_equal formatted_answer, @guess_1.sorted_answer
  end

  def test_it_can_create_a_formatted_guess
    formatted_guess = {
      r: [nil, 'r', nil, nil],
      y: ['y', nil, nil, nil],
      g: [nil, nil, nil, 'g'],
      b: [nil, nil, 'b', nil]
    }
    assert_equal formatted_guess, @guess_1.sorted_guess
  end

  def test_it_counts_red_matches
    guess = Guess.new(['r','r','g','b'], ['r', 'g', 'b', 'b'])
    guess.count_red_matches
    assert_equal 1, guess.number_of_correct_positions
  end

  def test_it_counts_green_matches
    guess = Guess.new(['r','r','g','g'], ['r', 'g', 'g', 'g'])
    guess.count_green_matches
    assert_equal 2, guess.number_of_correct_positions
  end

  def test_it_counts_blue_matches
    guess = Guess.new(['r','r','g','b'], ['r', 'g', 'b', 'b'])
    guess.count_blue_matches
    assert_equal 1, guess.number_of_correct_positions
  end

  def test_it_counts_yellow_matches
    guess = Guess.new(['y','r','g','b'], ['y', 'g', 'b', 'b'])
    guess.count_yellow_matches
    assert_equal 1, guess.number_of_correct_positions
  end

  def test_number_correct_elements
    guess = Guess.new(['y','r','g','b'], ['y', 'g', 'b', 'b'])
    assert_equal 3, guess.number_correct_elements
  end
end
