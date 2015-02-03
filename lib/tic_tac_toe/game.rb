module TicTacToe
  
  class Game
    
    attr_reader :current_player, :other_player, :board
    
    def initialize(players)
      @current_player, @other_player = players.shuffle
      @board = Board.new
    end
    
    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end
    
    def status
      @board.grid.each do |row|
        unless row[0].value.nil?
          return :winner if row.all? { |cell| cell.value == row[0].value }
        end
      end
      
      @board.grid.transpose.each do |row|
        unless row[0].value.nil?
          return :winner if row.all? { |cell| cell.value == row[0].value }
        end
      end
      
      diag1 = [@board.grid[0][0],@board.grid[1][1],@board.grid[2][2]]
      diag2 = [@board.grid[0][2],@board.grid[1][1],@board.grid[2][0]]
      
      unless diag1[0].value.nil?
        return :winner if diag1.all? { |cell| cell.value == diag1[0].value }
      end
      
      unless diag2[0].value.nil?
        return :winner if diag2.all? { |cell| cell.value == diag2[0].value }
      end
      
      return :tie if @board.grid.flatten.all? { |cell| cell.value != nil }
      
      :continue
    end
    
    def play
      puts "#{@current_player.name} has been randomly chosen to go first."
  
      until self.status != :continue do
        puts self.board.display_board
        puts "#{@current_player.name}, choose a position to make your move."
        self.get_position
        self.switch_players
      end
      
      if self.status == :winner
        puts "Congratulations, #{@other_player.name}!  You have won!"
      else
        puts "The game has ended in a tie."
      end
      
    end
    
    def get_position
      input = gets.chomp
      if input.to_i.between?(1,9)
        x = (input.to_i - 1) % 3
        y = (input.to_i - 1) / 3
        if self.board.grid[y][x].value == nil
          self.board.set_value(x,y, @current_player.sigil)
        else
          puts "That position has already been taken.  Please try again: "
          get_position
        end
      else
        puts "That is not a valid move.  Please try again: "
        get_position
      end
      
    end
    
  end
  
end