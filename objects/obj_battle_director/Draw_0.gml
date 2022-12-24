/// @description Insert description here
// You can write your code in this editor

rm_w=room_width;							rm_h=room_height;
stage_w = stage_col*cell_w;					stage_h = stage_row*cell_h;
spacing_w = (rm_w-stage_w)/2-cell_w/2;	spacing_h = (rm_h-stage_h)-(cell_h);

for (var j=1;j<=stage_row;j++)
{
	for (var i=1;i<=stage_col;i++)
	{
		
		//Black BG Tiles
		if tile_highlight[i,j]=1	color=3;		else if tile_owner[i,j]=1   color=1; 	else		color=2; 
		if  tile_type[i,j]=1 draw_sprite_ext(spr_tile,color,spacing_w+i*(cell_w),spacing_h+j*(cell_h),scale,scale,0,c_black,1);
		else if  tile_type[i,j]=0 draw_sprite_ext(spr_tile_hole,color,spacing_w+i*(cell_w),spacing_h+j*(cell_h),scale,scale,0,c_black,1);
		
		// Tiles
		if tile_highlight[i,j]=1	color=3;		else if tile_owner[i,j]=1   color=1; 	else		color=2; 
		if  tile_type[i,j]=1 draw_sprite_ext(spr_tile,color,spacing_w+i*(cell_w),spacing_h+j*(cell_h),scale,scale,0,c_white,stage_effect_alpha);
		else if  tile_type[i,j]=0 draw_sprite_ext(spr_tile_hole,color,spacing_w+i*(cell_w),spacing_h+j*(cell_h),scale,scale,0,c_white,stage_effect_alpha);
		
	}
}



