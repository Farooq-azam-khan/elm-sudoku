# Sudoku 
* This repo is designed to show how elm module can be used to have custom types contructors. 
* In a sudoku module we have an empty cell or a cell with a value. 
```elm 
type SudokuCell
    = EmptyCell
    | Number Int
```
* the value ranges from 1 to 9 inclusive. 
* We need to do some validation before constructing the Number type
* For that reason we need to do a function that does the validation first then construct the number type. 
```elm 
create_cell : Int -> SudokuCell
create_cell x =
    if x >= 1 && x <= 9 then
        Number x

    else
        EmptyCell
```
* Due to this validation function we cannot expose the `Number` and `EmptyCell` constructors. 


```elm 
module Sudoku exposing (SudokuCell, create_cell)
```
* the `SudokuCell` type is exposed but not the constructors
    * if we want to expose the constructors the export would be `SudokuCell(..)`

* The downside to this lack of exposition is that any sort of feature that require matching the types will need to be done in the file that contain the un-exposed type constructors. 
* For example, rendering the cell based on the type of cell it is: 
```
cell_to_string : String -> SudokuCell -> String
cell_to_string empty_str_as sudoku_cell =
    case sudoku_cell of
        EmptyCell ->
            empty_str_as

        Number n ->
            String.fromInt n
```
