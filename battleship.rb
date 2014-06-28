# require_relative 'board'
require 'pry'

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

# ship = "A"

# i = 0
# while i < 5
#   board[0][i] = ship
#   i += 1
# end

######################
# VERTICAL PLACEMENT #
######################

# ship = "B"

# i = 1

# while i < 5
#   board[i][0] = ship
#   i += 1
# end

# puts "Vertical placement"
# puts board.inspect

###################
# PLACE ALL SHIPS #
###################

ships = {"A" => [], "B" => [], "C" => [], "D" => [], "S" => [] }
size = {"A" => 5, "B" => 4, "C" => 3, "D" => 2, "S" => 1 }

ships.each do |ship, position|
  start = []
  print "Starting position for ship #{ship} (row): "
  start[0] = gets.chomp.to_i
  print "Starting position for ship #{ship} (column): "
  start[1] = gets.chomp.to_i
  print "Orientation? (h for horizontal, v for vertical): "
  orientation = gets.chomp.downcase

  i = start[0]
  j = start[1]
  if orientation == 'h'
    while j < size[ship]
      board[i][j] = ship
      j +=1
    end
  else
     while i < size[ship]
      board[i][j] = ship
      i += 1
    end
  end
  puts board.inspect
end


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

