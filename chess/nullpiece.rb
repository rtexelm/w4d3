require_relative "piece"
require_relative "slideable"

class NullPiece < Piece
    include Slideable

    def symbol
        # color == :black ? ♜ : ♖
        'nullpiece'
    end

    private
    def move_dirs
        horizontal_dirs
    end
end