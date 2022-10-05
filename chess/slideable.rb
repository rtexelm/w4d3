module Slideable

    HORIZONTAL_DIRS = [
        [0, -1], #left, based on how we set up the grid
        [0, 1], #right
        [-1, 0], #up
        [1, 0] #down
    ].freeze

    DIAGONAL_DIRS = [
        [-1, -1], #up + left
        [-1, 1], #up + right
        [1, -1], #down + left
        [1, 1] #down + right
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves_arr = []
        move_dirs.each do |dir| # test subclass call for move_dirs
            dx, dy = dir
            grown = grow_unblocked_moves_in_dir(dx, dy)
            all_moves_arr.concat(grown)
        end
        all_moves_arr
    end

    private

    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        grown_moves = []
        x, y = pos

        while true
            next_pos = [x+=dx, y+=dy] 
            #case 1: out of bounds
            unless next_pos.all? {|coord| coord.between?(0, 7) }
                return grown_moves
            end
            #case 2: Encounter same color piece
            if board[next_pos].color == color && !board[next_pos].empty?
                return grown_moves
            end
            #case 3: Encounter different colot piece
            if board[next_pos].color != color && !board[next_pos].empty?
                return grown_moves.push(next_pos)
            end
            grown_moves.push(next_pos)
        end

        grown_moves
    end

end

