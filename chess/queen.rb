require_relative "piece"

class Queen < Piece
    include Slideable

    def symbol
        @color == black ? ♛ : ♕
    end

    private
    def move_dirs
        Slideable.DIAGONAL_DIRS.concat(Slideable.HORIZONTAL_DIRS)
    end

end