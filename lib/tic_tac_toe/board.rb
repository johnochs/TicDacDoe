module TicTacToe
  class Board
    attr_reader :grid
    
    def initialize
      @grid = Array.new(3) { Array.new(3) { Cell.new }}
    end
    
    def set_value(x, y, value)
      cell = @grid[y][x]
      cell.set_value(value)
    end
    
    def display_board
      i = 1
      out_string = ""
      @grid.each do |row|
        row_array = []
        row.each do |cell|
          row_array << (cell.value == nil ? i.to_s : cell.value)
          i += 1
        end
        out_string += row_array.join(' | ').to_s
        out_string += "\n_________\n" unless i == 10
      end
      out_string
    end
    
    
  end
end