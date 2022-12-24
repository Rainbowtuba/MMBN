/// @function	collision_line_first(x1,y1,x2,y2,object,prec,notme)
/// @param		x1       first point on collision line, real
/// @param		y2       first point on collision line, real
/// @param		x2       second point on collision line, real
/// @param		y2       second point on collision line, real
/// @param		object      which objects to look for (or all), real
/// @param		prec        if true, use precise collision checking, bool
/// @param		notme       if true, ignore the calling instance, bool
//     
//  Returns the instance id of an object colliding with a given line and
//  closest to the first point, or noone if no instance found.
//  The solution is found in log2(range) collision checks.
/// GMLscripts.com/license
function collision_line_first()
{
    var ox,oy,dx,dy,object,prec,notme,sx,sy,inst,i;
    ox=argument[0];
    oy=argument[1];
    dx=argument[2];
    dy=argument[3];
    object=argument[4];
    prec=argument[5];
    notme=argument[6];
    sx=dx-ox;
    sy=dy-oy;
    inst=collision_line(ox,oy,dx,dy,object,prec,notme);
    if (inst!=noone) 
	{
        while ((abs(sx)>=1)||(abs(sy)>=1)) 
		{
            sx/=2;
            sy/=2;
            i=collision_line(ox,oy,dx,dy,object,prec,notme);
            if (i) 
			{
                dx-=sx;
                dy-=sy;
                inst=i;
            }
			else
			{
                dx+=sx;
                dy+=sy;
            }
        }
    }
    return inst;
}