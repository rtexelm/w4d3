require_relative "piece"

class Bishop < Piece
    include Slideable

    def symbol
        @color == black ? ♝ : ♗
    end

    private
    def move_dirs
        Slideable.DIAGONAL_DIRS
    end

end