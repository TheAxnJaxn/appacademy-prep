require "./game"
require "./board"
require "./player"

player1 = HumanPlayer.new(:X)
player2 = ComputerPlayer.new(:-)

g = Game.new(player1, player2)
g.play