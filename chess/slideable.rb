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

    end

    private

    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)

    end

end

