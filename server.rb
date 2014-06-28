require 'pry'
require 'sinatra'


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
    prompt "Starting position for #{player} #{ship} (row): "
    start[0] = gets.chomp.to_i
    prompt "Starting position for #{player} #{ship} (column): "
    start[1] = gets.chomp.to_i
    prompt "Orientation? (h for horizontal, v for vertical): "
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

##########
# BATTLE #
##########

def fire_and_check_winner(player1, player2, player1_ships, player2_ships, player1_board, player2_board)
  winner = false
  shot = []
  valid_shot = false

  until valid_shot
    prompt "Fire a shot, #{player1} (row): "
    shot[0] = gets.chomp.to_i
    prompt "Fire a shot, #{player1} (column): "
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

get '/' do
  erb: index
end




