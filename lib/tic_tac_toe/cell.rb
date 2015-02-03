module TicTacToe
  
  class Cell
    
    attr_reader :value
    
    def initialize(value = nil)
      @value = value
    end
    
    def set_value(value)
      if @value.nil?
        @value = value
      end
    end
    
  end
  
end