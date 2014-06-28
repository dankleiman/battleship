class Board
  attr_accessor :board

  def initialize(board = [])
    @board = board
    10.times do
      row = []
      10.times do
        row << "O"
      end
      @board << row
    end
  end



end
