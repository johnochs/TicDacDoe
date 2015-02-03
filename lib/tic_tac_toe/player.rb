module TicTacToe
  
  class Player
    
    attr_reader :name, :sigil
    
    def initialize(input)
      @name = input.fetch(:name)
      @sigil = input.fetch(:sigil)
    end
    
  end
  
end