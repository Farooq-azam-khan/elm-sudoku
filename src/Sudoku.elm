module Sudoku exposing (SudokuCell, cell_to_string, create_cell)


type SudokuCell
    = EmptyCell
    | Number Int


create_cell : Int -> SudokuCell
create_cell x =
    if x >= 1 && x <= 9 then
        Number x

    else
        EmptyCell


cell_to_string : String -> SudokuCell -> String
cell_to_string empty_str_as sudoku_cell =
    case sudoku_cell of
        EmptyCell ->
            empty_str_as

        Number n ->
            String.fromInt n
