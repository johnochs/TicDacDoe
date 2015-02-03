require "spec_helper"

module TicTacToe
  
  describe Board do
    
    context "#initialize" do
      
      it "creates a default grid with 3 rows" do
        board = Board.new
        expect(board.grid.size).to eq 3
      end
      
      it "creates three objects in each row and each object is a Cell" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq 3
          expect(row.all? {|element| element.is_a?(Cell)}).to eq true
        end
      end
      
    end
    
    context "#set_value" do
      
      it "sets the value of the cell at the (x,y) coordinate of the grid to {value}" do
        board = Board.new
        board.set_value(2,2, "X")
        expect(board.grid[2][2].value).to eq "X"
      end
      
    end
    
    context "#display_board" do
      
      it "should display an empty board properly" do
        board = Board.new
        output = "1 | 2 | 3\n_________\n4 | 5 | 6\n_________\n7 | 8 | 9"
        expect(board.display_board).to eq output
      end
      
      it "displays a board with some moves properly" do
        board = Board.new
        board.set_value(1,1, "O")
        board.set_value(2,0, "X")
        output = "1 | 2 | X\n_________\n4 | O | 6\n_________\n7 | 8 | 9"
        expect(board.display_board).to eq output
      end
      
    end
  
  end
  
end