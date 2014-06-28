

//Record position of each ship -- addClass('ship-' + currentShip) to each cell
function placeShips(ships, size) {
  for (var i = 0; i < ships.length; i++) {
    var ship = ships[i]
    var size = sizes[i]
    var start = [];
    var row = prompt("Starting Row for "+ship+" (0-9):");
    start[0] = row;
    var col = prompt("Starting Column for "+ship+" (0-9):");
    start[1] = col;
    var orientation = prompt("Orientation? (h for horizontal, v for vertical):").toLowerCase();

    for (var j = 0; j < size; j++) {
      $(".row:eq("+row+") > .square:eq("+col+")").addClass("ship")
      if (orientation === 'h'){
        col ++
      } else{
        row ++
      }
    }
  }
};

var ships = [
  'Aircraft Carrier',
  'Battleship',
  'Cruiser',
  'Destroyer'
  ];

var sizes = [5, 4, 3, 2];

placeShips(ships, sizes);

//Fire a shot
$('.board').on('click', '.square', function(event) {
  var $square = $(event.currentTarget);
  if ($square.hasClass('ship')) {
    $square.addClass('hit');
  } else {
    $square.addClass('miss');
  };
});

