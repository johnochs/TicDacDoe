require "spec_helper"

module TicTacToe
  describe Cell do
  
    context "#initialize" do
    
      it "initializes to a default value of nil" do
        cell = Cell.new
        expect(cell.value).to eq nil
      end
      
      it "can be initialized with a specified value" do
        cell = Cell.new("X")
        expect(cell.value).to eq "X"
      end
    
    end
    
    context "#set_value" do
      
      it "allows you to set a value on a cell with an existing nil value" do
        cell = Cell.new
        cell.set_value("X")
        expect(cell.value).to eq "X"
      end
      
      it "does not allow you to set a value on a cell with an existing non-nil value" do
        cell = Cell.new
        cell.set_value("X")
        cell.set_value("Y")
        expect(cell.value).to_not eq "Y"
      end
      
    end
  
  
  end
end