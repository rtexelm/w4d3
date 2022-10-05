require_relative 'piece'

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8, nil)}
        # pawns
        rows[1] = Array.new(8, Piece.new("pawn"))
        rows[6] = Array.new(8, Piece.new("pawn"))
        # rooks
        rows[0][0] = Piece.new("rook")
        rows[0][7] = Piece.new("rook")
        rows[7][0] = Piece.new("rook")
        rows[7][7] = Piece.new("rook")
        # knights
        rows[0][1] = Piece.new("knight")
        rows[0][6] = Piece.new("knight")
        rows[7][1] = Piece.new("knight")
        rows[7][6] = Piece.new("knight")  
        # bishops
        rows[0][2] = Piece.new("bishop")
        rows[0][5] = Piece.new("bishop")
        rows[7][2] = Piece.new("bishop")
        rows[7][5] = Piece.new("bishop")
        # queen
        rows[0][3] = Piece.new("queen")
        rows[7][3] = Piece.new("queen")
        # king
        rows[0][4] = Piece.new("king")
        rows[7][4] = Piece.new("king")
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        unless start_pos.all? {|idx| idx.between?(0,7)}
            raise 'starting position out of bounds'
        end

        unless end_pos.all? {|idx| idx.between?(0,7)}
            raise 'ending position out of bounds'
        end

        if self[start_pos] == nil 
            raise 'no piece at starting position'
        elsif self[end_pos] != nil
            raise 'end position occupied'
        end

        self[end_pos] = self[start_pos]
        self[start_pos] = nil

    end

    def print_board
        rows.each{|row| print "#{row}\n"}
    end


end

b = Board.new
b.print_board

b.move_piece([2,0], [3,0])
b.print_board

