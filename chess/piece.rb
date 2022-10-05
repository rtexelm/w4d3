class Piece
    
    attr_accessor :pos
    attr_reader :board, :color

    def initialize(color, board, pos)
        @color = color #symbol
        @board = board # Current board instance
        @pos = pos # Current pos array
    end

    def to_s
        # "#{symbol}"
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        
    end

    def symbol
        raise NotImplementedError
    end

    private
    def move_into_check?(end_pos)

    end
    
end

# class NullPiece < Piece

#     def intialize
#         @type = "null"
#     end

# end

piece = Piece.new("red", "r", "r")
puts piece