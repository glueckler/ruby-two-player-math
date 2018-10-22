require './game.rb'

the_game = Game.new()

while the_game.on
  the_game.next()
end