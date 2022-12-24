
///@function ds_grid_swap_rows(id,row1,row2)
    //Exchanges the contents of two entire grid rows.
    //
 ///@param      id          grid data structure, real
 ///@param      row1        1st row of the exchange, real
 ///@param      row2        2nd row of the exchange, real

 /// GMLscripts.com/license
function ds_grid_swap_rows(){
        var i, temp;
        i = 0;
        repeat (ds_grid_width(argument[0])) {
            temp = ds_grid_get(argument[0], i, argument[1]);
            ds_grid_set(argument[0], i, argument[1], ds_grid_get(argument[0], i, argument[2]));
            ds_grid_set(argument[0], i, argument[2], temp);
            i += 1;
        }
        return 0;
    
    
}