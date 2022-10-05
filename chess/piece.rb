class Piece
    
    attr_writer :pos

    def initialize(color, board, pos)
        @color = color #symbol
        @board = board
        @pos = pos
    end

    def to_s
        self.class.name
    end

    def empty?

    end

    def valid_moves

    end

    # def Symbol

    # end

    private
    def move_into_check?(end_pos)

    end
    
end

class NullPiece < Piece

    def intialize
        @type = "null"
    end

end

class Rook < Piece

    # def initialize
        
    # end

    def inspect
        "rook"
    end

end

piece = Piece.new("red", "r", "r")
puts piece