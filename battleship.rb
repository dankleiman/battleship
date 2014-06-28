require 'pry'

##############
# DRAW BOARD #
##############
def new_board
  board = []
  10.times do
    row = []
    10.times do
      row << "O"
    end
    board << row
  end
  board
end


###################
# PLACE ALL SHIPS #
###################

def place_ships(player, board, ships, size)
  ships.each do |ship, position|
    start = []
    print "Starting position for #{player} #{ship} (row): "
    start[0] = gets.chomp.to_i
    print "Starting position for #{player} #{ship} (column): "
    start[1] = gets.chomp.to_i
    print "Orientation? (h for horizontal, v for vertical): "
    orientation = gets.chomp.downcase

    i = start[0]
    j = start[1]

    size[ship].times do
      board[i][j] = ship
      position << [i, j]
      if orientation == 'h'
        j +=1
      else
        i +=1
      end
    end
  end
end

# ships = {"Aircraft Carrier" => [], "Battleship" => [], "Cruiser" => [], "Destroyer" => [] }
# size = {"Aircraft Carrier" => 5, "Battleship" => 4, "Cruiser" => 3, "Destroyer" => 2 }

size = {"Aircraft Carrier" => 5}
my_ships = {"Aircraft Carrier" => []}
# enemy_ships = {"Aircraft Carrier" => []}

my_board = new_board
# enemy_board = new_board

place_ships("Player 1", my_board, my_ships, size)
# place_ships("Enemy", enemy_board, enemy_ships, size)

########################################
# FIRE A SHOTS UNTIL ALL SHIPS GO DOWN #
########################################
puts my_board.inspect
until my_ships.empty?
  shot = []
  print "Fire a shot (row): "
  shot[0] = gets.chomp.to_i
  print "Fire a shot (column): "
  shot[1] = gets.chomp.to_i

  if my_board[shot[0]][shot[1]] == "O"
    puts "Miss!"
  else
    my_board[shot[0]][shot[1]] = "H"
    puts "Hit!"
    my_ships.each do |ship, position|
      hits = 0
      position.each do |p|
        row = p[0]
        col = p[1]
        if my_board[row][col] == 'H'
          hits += 1
        end
      end
      if hits == position.length
        puts "You sunk my #{ship}!"
        my_ships.delete(ship)
      end
    end
  end
end
