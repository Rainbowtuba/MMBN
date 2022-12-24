///@function ds_grid_shuffle_adv(index, by_col, by_row)
///@param   index		The input DS map, DSMap
///@param   by_col      shuffles by column (true or false)
///@param   by_row	    shuffles by row (true or false)
function ds_grid_shuffle_adv(){
///ds_grid_shuffle_adv(DSGridIndex, x, y)
// This script will not "randomize()", you must set that your self,
// that way you can use a seed if you want.

var _grid, _width, widthmax, _height, heightmax, _gridTemp;


_grid     = argument[0];
_width    = ds_grid_width(_grid);
widthmax  = _width
_height   = ds_grid_height(_grid);
heightmax = _height
_gridTemp = ds_grid_create(_width,_height)

if (argument[1] = 1) && (argument[2] = 0)
{
    for (var _i=0; _i < widthmax; _i++)
    {
        _width = ds_grid_width(_grid)
        var xrandom = irandom(_width-1)
        ds_grid_set_grid_region(_gridTemp, _grid, xrandom, 0, xrandom, _height-1, _i, 0)
        ds_grid_set_grid_region(_grid, _grid, xrandom+1, 0, _width-1, _height-1, xrandom, 0);
        ds_grid_resize(_grid,_width-1,_height);
        if (_width = 1) break;
    }
    ds_grid_resize(_grid, widthmax, heightmax)
    _grid = _gridTemp
}


if (argument[1] = 0) && (argument[2] = 1)
{
    for (var _i=0; _i < heightmax; _i++)
    {
        _height = ds_grid_height(_grid)
        var yrandom = irandom(_height-1)
        ds_grid_set_grid_region(_gridTemp, _grid, 0, yrandom, _width-1, yrandom, 0, _i)
        ds_grid_set_grid_region(_grid, _grid, 0, yrandom+1, _width-1, _height-1, 0, yrandom);
        ds_grid_resize(_grid,_width,_height-1);
        if (_height = 1) break;
    }
    ds_grid_resize(_grid, widthmax, heightmax)
    _grid = _gridTemp
}

if  (argument[1] = 1) && (argument[2] = 1)
{
    ds_grid_shuffle(_grid)
}

return _grid;
ds_grid_destroy(_gridTemp)


}