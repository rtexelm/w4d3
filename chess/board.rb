require_relative 'pieces'

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        #nullpieces
        (0..7).each do |row_i|
           (0..7).each do |col_i|
                rows[row_i][col_i] = NullPiece.new(:black, self, [row_i, col_i])
           end
        end
        # pawns
        # rows[1] = Array.new(8, Piece.new("pawn"))
        # rows[6] = Array.new(8, Piece.new("pawn"))
        # rooks
        rows[0][0] = Rook.new(:black, self, [0,0])
        rows[0][7] = Rook.new(:black, self, [0,7])
        rows[7][0] = Rook.new(:white, self, [7,0])
        rows[7][7] = Rook.new(:white, self, [7,7])
        # knights
        # rows[0][1] = Piece.new("knight")
        # rows[0][6] = Piece.new("knight")
        # rows[7][1] = Piece.new("knight")
        # rows[7][6] = Piece.new("knight")  
        # bishops
        rows[0][2] = Bishop.new(:black, self, [0,2])
        rows[0][5] = Bishop.new(:black, self, [0,5])
        rows[7][2] = Bishop.new(:white, self, [7,2])
        rows[7][5] = Bishop.new(:white, self, [7,5])
        # queen
        rows[0][3] = Queen.new(:black, self, [0,3])
        rows[7][3] = Queen.new(:white, self, [7,3])
        # king
        # rows[0][4] = Piece.new("king")
        # rows[7][4] = Piece.new("king")
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
# p b[[0,0]]
# p b.rows[0][0].moves
# b.print_board

b.print_board
b.move_piece([2,0], [3,0])
b.print_board

#test comment