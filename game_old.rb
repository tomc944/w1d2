require_relative "board.rb"
require_relative "card.rb"

class Game
  attr_accessor :previous_guess, :guessed_pos, :board
  attr_accessor :prev_guess_sym

  def initialize
    @board = Board.new
    @board.populate
    @previous_guess = nil
  end

  def make_guess(guessed_pos)
    @previous_guess_sym = @board.reveal(@guessed_pos)
    @board.render
  end

  def play
    until @board.won?
      play_step
    end
  end

  def play_step
    @board.render
    puts "Take a guess!"
    @guessed_pos = gets.chomp
    make_guess(@guessed_pos)
    @previous_guess = @guessed_pos
    puts "Take another guess!"
    @guessed_pos = gets.chomp
    make_guess(@guessed_pos)
    pg = board.convert(@previous_guess)
    gp = board.convert(@guessed_pos)
    if !(@board.grid[pg.first][pg.last] == @board.grid[gp.first][gp.last])
      @board.grid[pg.first][pg.last].hide
      @board.grid[gp.first][gp.last].hide
    end
    print "\n"

  end
end
