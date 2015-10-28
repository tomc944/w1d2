require_relative "card.rb"

class Board
  attr_accessor :grid

  def initialize
    #@grid = Array.new(4) { Array.new(4) }
    @grid = Array.new(2) { Array.new(2) }
  end

  def populate
    #card_array = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]
    card_array = [1,1,2,2]
    card_array.shuffle!
    i = 0
    @grid.each_index do |row|
      @grid.each_index do |col|
        @grid[row][col] = Card.new(card_array[i])
        i+=1
      end
    end
  end

  def render
    @grid.each_index do |row|
      @grid.each_index do |col|
        # self[row, col].to_s
        if @grid[row][col].face_down
          print "-"
        else
          print @grid[row][col].face_value
        end
      end
      print "\n"
    end
  end

  # Flatten and use enumerable method
  def won?
    @grid.each_index do |row|
      @grid.each_index do |col|
        return false if @grid[row][col].face_down
      end
    end
    true
  end

  def convert(guessed_pos)
    newGP = guessed_pos.split(",")
    newGP.map! { |el| el.to_i }
  end

  def reveal(guessed_pos)
    newGP = convert(guessed_pos)
    @grid[newGP.first][newGP.last].reveal
    return @grid[newGP.first][newGP.last]
  end
end
