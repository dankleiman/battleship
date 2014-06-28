# require_relative 'board'
# require 'pry'

# board = Board.new
# binding.pry


board = []
10.times do
  row = []
  10.times do
    row << "O"
  end
  board << row
end

########################
# HORIZONTAL PLACEMENT #
########################

ship = "A"

i = 0
while i < 5
  board[0][i] = ship
  i += 1
end

######################
# VERTICAL PLACEMENT #
######################

ship = "B"

i = 1

while i < 5
  board[i][0] = ship
  i += 1
end

puts "Vertical placement"
puts board.inspect

###############
# FIRE A SHOT #
###############

shot = [0,0]
print "Fire a shot (row): "
shot[0] = gets.chomp.to_i
print "Fire a shot (column): "
shot[1] = gets.chomp.to_i
#factor in array counting vs column display?

if board[shot[0]][shot[1]] == "O"
  puts "Miss!"
else
  board[shot[0]][shot[1]] = "H"
  puts "Hit"
end

puts board.inspect

###############
# SINK A SHIP #
###############

