require_relative "piece"

class Queen < Piece
    include Slideable

    def symbol
        @color == black ? ♛ : ♕
    end

    private
    def move_dirs
        diagonal_dirs.concat(horizontal_dirs)
    end

end