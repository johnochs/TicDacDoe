require "spec_helper"

module TicTacToe
  describe Game do
    
    let (:john) { Player.new(name: "John", sigil: "X") }
    let (:bob) { Player.new(name: "Bob", sigil: "O") }
    
    context "#initialize" do
      
      it "initializes without errors given proper inputs (players)" do
        players = [john, bob]
        expect { Game.new(players) }.to_not raise_error
      end
      
      xit "sets values for @current_player and @other_player" do
        players = [john, bob]
        game = Game.new(players)
        expect(game.current_player).to eq (john || bob)
        expect(game.other_player).to eq 
        expect(game.current_player).to_not eq game.other_player
      end
      
      it "creates a new blank board upon initialization" do
        players = [john, bob]
        game = Game.new(players)
        expect(game.board.is_a?(Board)).to eq true
      end
      
    end
    
    context "#switch_players" do
      
      it "switches players appropriately" do
        players = [john, bob]
        game = Game.new(players)
        current_player = game.current_player
        game.switch_players
        expect(game.current_player).to_not eq current_player
      end
      
    end
    
    context "#status" do
      
      it "returns :winner if the game has been won" do
        players = [john, bob]
        game = Game.new(players)
        game.board.set_value(0,0, game.current_player.sigil)
        game.board.set_value(0,1, game.current_player.sigil)
        game.board.set_value(0,2, game.current_player.sigil)
        expect(game.status).to eq :winner
      end
      
      it "returns :tie if the game has not been won and there are no more spaces" do
        players = [john, bob]
        game = Game.new(players)
        game.board.set_value(0,0, game.current_player.sigil)
        game.board.set_value(1,1, game.current_player.sigil)
        game.board.set_value(2,1, game.current_player.sigil)
        game.board.set_value(0,2, game.current_player.sigil)
        game.board.set_value(1,2, game.current_player.sigil)
        game.board.set_value(1,0, game.other_player.sigil)
        game.board.set_value(2,0, game.other_player.sigil)
        game.board.set_value(0,1, game.other_player.sigil)
        game.board.set_value(2,2, game.other_player.sigil)
        expect(game.status).to eq :tie
      end
      
      it "returns :continue if the game is not finished yet" do
        players = [john, bob]
        game = Game.new(players)
        game.board.set_value(0,0, game.current_player.sigil)
        game.board.set_value(1,1, game.other_player.sigil)
        expect(game.status).to eq :continue
      end
      
    end
    
  end
end