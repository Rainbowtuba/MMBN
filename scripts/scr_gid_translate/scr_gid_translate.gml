///@function ds_grid_translate(id,horiz,vert)
///@param   id          grid data structure, real
///@param   horiz       horizontal shift, real
///@param   vert        vertical shift, real
function scr_gid_translate(){

    
        var dsid,w,h,sx,sy,mx,my,dx,dy,temp;
        dsid = argument0;
        w = ds_grid_width(dsid);
        h = ds_grid_height(dsid);
        sx = (((argument1 mod w)+w) mod w);
        sy = (((argument2 mod h)+h) mod h);
        mx = w-1;
        my = h-1;
        dx = mx-sx;
        dy = my-sy;
        temp = ds_grid_create(w,h);
        ds_grid_set_grid_region(temp,dsid,0,0,dx,dy,sx,sy);
        if (sx>0) ds_grid_set_grid_region(temp,dsid,dx+1,0,mx,dy,0,sy);
        if (sy>0) ds_grid_set_grid_region(temp,dsid,0,dy+1,dx,my,sx,0);
        if ((sx>0) && (sy>0)) ds_grid_set_grid_region(temp,dsid,dx+1,dy+1,mx,my,0,0);
        ds_grid_copy(dsid,temp);
        ds_grid_destroy(temp);
        return 0;
    
}