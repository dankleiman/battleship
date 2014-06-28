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
    valid_position = false
    until valid_position
      start = []
      print "Starting position for #{player} #{ship} (row): "
      start[0] = gets.chomp.to_i
      print "Starting position for #{player} #{ship} (column): "
      start[1] = gets.chomp.to_i
      print "Orientation? (h for horizontal, v for vertical): "
      orientation = gets.chomp.downcase
      i = start[0]
      j = start[1]
      if orientation == 'h' && (j + size[ship]) > 9
        puts "Please pick a location inside the grid for this ship."
      elsif orientation == 'v' && (i + size[ship]) > 9
        puts "Please pick a location inside the grid for this ship."
      else
        valid_position = true
      end
    end
    size[ship].times do
      board[i][j] = ship
      position << [i, j]
      if orientation == 'h'
        j +=1
      else
        i +=1
      end
    end
    puts
    puts
    puts "#{player} Board:"
    board.each do |row|
      puts row.inspect
    end
    puts
    puts
  end
end

##########
# BATTLE #
##########

def fire_and_check_winner(player1, player2, player1_ships, player2_ships, player1_board, player2_board)
  winner = false
  shot = []
  valid_shot = false

  until valid_shot
    print "Fire a shot, #{player1} (row): "
    shot[0] = gets.chomp.to_i
    print "Fire a shot, #{player1} (column): "
    shot[1] = gets.chomp.to_i

    if shot[0] > 9 || shot[1] > 9
      puts "Please aim to hit the board."
    elsif player2_board[shot[0]][shot[1]] == "M" || player2_board[shot[0]][shot[1]] == "H"
      puts "Shoot somewhere new, please!"
    else
      valid_shot = true
    end
  end

  if player2_board[shot[0]][shot[1]] == "O"
    puts "Miss!"
    player2_board[shot[0]][shot[1]] = "M"
  else
    player2_board[shot[0]][shot[1]] = "H"
    puts "Hit!"
    player2_ships.each do |ship, position|
      hits = 0
      position.each do |p|
        row = p[0]
        col = p[1]
        if player2_board[row][col] == 'H'
          hits += 1
        end
      end
      if hits == position.length
        puts "You sunk #{player2} #{ship}!"
        player2_ships.delete(ship)
      end
      if player2_ships.empty?
        winner = true
      end
    end
  end
  winner
end

##############
# START GAME #
##############

# ships = {"Aircraft Carrier" => [], "Battleship" => [], "Cruiser" => [], "Destroyer" => [] }
size = {"Aircraft Carrier" => 5, "Battleship" => 4, "Cruiser" => 3, "Destroyer" => 2 }

first_player_ships = {"Aircraft Carrier" => [], "Battleship" => [], "Cruiser" => [], "Destroyer" => [] }
second_player_ships = {"Aircraft Carrier" => [], "Battleship" => [], "Cruiser" => [], "Destroyer" => [] }

first_player_board = new_board
second_player_board = new_board

place_ships("Player 1", first_player_board, first_player_ships, size)
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
place_ships("Player 2", second_player_board, second_player_ships, size)
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts
puts

winner = false

until winner
  if fire_and_check_winner("Player 1", "Player 2", first_player_ships, second_player_ships, first_player_board, second_player_board)
    puts "Player 1 wins!"
    winner = true
  elsif fire_and_check_winner("Player 2", "Player 1", second_player_ships, first_player_ships, second_player_board, first_player_board)
    puts "Player 2 wins!"
    winner = true
  end
end



