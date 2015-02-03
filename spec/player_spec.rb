require "spec_helper"

module TicTacToe
  
  describe Player do
    
    context "#initialize" do
      
      it "will initialize properly with a name and a sigil" do
        expect { Player.new(name: "John", sigil: "X") }.to_not raise_error
      end
      
      it "will raise an error if not initialized with proper attributes" do
        expect { Player.new }.to raise_error
      end
      
    end
    
    context "#sigil" do
      
      it "will return the players sigil" do
        player = Player.new(name: "Frank", sigil: "O")
        expect(player.sigil).to eq "O"
      end
      
    end
    
    context "#name" do
      
      it "will return the players name" do
        player = Player.new(name: "Tim", sigil: "X")
        expect(player.name).to eq "Tim"
      end
      
    end
    
  end
  
end