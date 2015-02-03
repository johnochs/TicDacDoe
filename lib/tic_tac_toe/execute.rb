require_relative "../tic_tac_toe"

include TicTacToe

def main

  puts "Welcome to Tic-Tac-Toe!"
  puts "Player 1, please type your name and press Enter."
  p1name = gets.chomp
  puts "#{p1name}, please pick a sigil. (Usually an \"X\" or an \"O\")"
  p1sigil = gets.chomp

  puts "Player 2, please type your name and press Enter."
  p2name = gets.chomp
  puts "#{p2name}, please pick a sigil. (Usually an \"X\" or an \"O\")"
  p2sigil = gets.chomp

  player1 = Player.new(name: p1name, sigil: p1sigil)
  player2 = Player.new(name: p2name, sigil: p2sigil)

  keep_playing = true
  
  until keep_playing == false
    game = Game.new([player1, player2])
    game.play
    
    puts "Would you like to play another game? (yes/no)"
    response = gets.chomp
    
    if response.downcase == "yes"
      game = Game.new([player1, player2])
    else
      keep_playing = false
      puts "Thanks for playing!"
    end
  end
  
end

main