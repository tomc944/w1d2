require_relative "board.rb"
require_relative "card.rb"

class Game
  attr_accessor :previous_card, :guessed_pos, :board, :current_card

  def initialize
    @board = Board.new
    @board.populate
    @previous_card = nil
  end

  def play
    until @board.won?
      play_step
    end
  end

  private

  def make_guess
    if (!@previous_card == @current_card) && @previous_card != nil
      @previous_card.hide
      @current_card.hide
      @previous_card, @current_card = nil, nil
    end
  end

  def play_step
    @board.render
    puts "Take a guess!"

    @guessed_pos = gets.chomp
    @current_card = @board.reveal(@guessed_pos)

    make_guess
    @previous_card = @current_card
    print "\n"
  end
  #
  # def play_step
  #   render_board
  #   receieve_guess
  #   reveal_card
  #   receive_guess_second
  #   reveal_card
  #   check_guesses
  # end
end
