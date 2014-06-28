require 'pry'

##############
# DRAW BOARD #
##############


board = []
10.times do
  row = []
  10.times do
    row << "O"
  end
  board << row
end

###################
# PLACE ALL SHIPS #
###################

ships = {"A" => [], "B" => [], "C" => [], "D" => [] }
size = {"A" => 5, "B" => 4, "C" => 3, "D" => 2 }

ships = {"A" => []}
size = {"A" => 5}

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
      position << [i, j]
      j +=1
    end
  else
     while i < size[ship]
      board[i][j] = ship
      position << [i, j]
      i += 1
    end
  end
  puts "Position of Ship #{ship}: #{position}"
end

###############
# FIRE A SHOT #
###############

until ships.empty?
  shot = []
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
  ships.each do |ship, position|
    hits = 0
    position.each do |p|
      row = p[0]
      col = p[1]
      if board[row][col] == 'H'
        hits += 1
        puts board.inspect
      end
    end
    if hits == position.length
      puts "You sunk my #{ship} Ship!"
      ships.delete(ship)
    end
  end
end




