var ships = {
  'Aircraft Carrier': [],
  'Battleship': [],
  'Cruiser': [],
  'Destroyer': []
};
var size = {"Aircraft Carrier" => 5, "Battleship" => 4, "Cruiser" => 3, "Destroyer" => 2 }
//Record position of each ship
ships.each do |ship, position|
    start = []
    print "Starting position for #{player} #{ship} (row): "
    start[0] = gets.chomp.to_i
    print "Starting position for #{player} #{ship} (column): "
    start[1] = gets.chomp.to_i
    print "Orientation? (h for horizontal, v for vertical): "
    orientation = gets.chomp.downcase

    j = start[0]
    k = start[1]

    for (i = 0; i < size[ship]; i++) {
      board[j][k] = ship
      position << [j, k]
      if orientation == 'h'
        k +=1
      else
        j +=1
      end
    };
  end
end






//Fire a shot
$('.board').on('click', ".square", function(event) {
  var $square = $(event.currentTarget);
  if ($square.hasClass('ship')) {
    $square.addClass('hit');
  } else {
    $square.addClass('miss');
  };
});

