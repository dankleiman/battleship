// var ships = {
//   'Aircraft Carrier': [],
//   'Battleship': [],
//   'Cruiser': [],
//   'Destroyer': []
// };
// var size = {"Aircraft Carrier" => 5, "Battleship" => 4, "Cruiser" => 3, "Destroyer" => 2 };

//Record position of each ship -- addClass('ship-' + currentShip) to each cell
function placeShips(ship, size) {
  var start = [];
  var row = prompt("Starting Row for "+ship+" (0-9):");
  start[0] = row;
  var col = prompt("Starting Column for "+ship+" (0-9):");
  start[1] = col;
  var orientation = prompt("Orientation? (h for horizontal, v for vertical):").toLowerCase();
  for (var i = 0; i < size; i++) {
    if (orientation === 'h'){
      col ++
      $(".row:eq("+row+") > .square:eq("+col+")").addClass('ship')
      console.log(row, col)
    }
  }

  };



placeShips('Aircraft Carrier', 5);

//Fire a shot
$('.board').on('click', '.square', function(event) {
  var $square = $(event.currentTarget);
  if ($square.hasClass('ship')) {
    $square.addClass('hit');
  } else {
    $square.addClass('miss');
  };
});

