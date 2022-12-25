/// @description Insert description here
// You can write your code in this editor
x=spacing_w+grid_x*(cell_w);
y=spacing_h+grid_y*(cell_h);

if place_meeting(x,y,obj_enemy_parent)
{
	if grid_x-1>0&&tile_owner[grid_x-1,grid_y]=1&&tile_type[grid_x-1,grid_y]=0	grid_x-=1
	else if grid_x+1>0&&tile_owner[grid_x+1,grid_y]=1&&tile_type[grid_x+1,grid_y]=0	grid_x+=1
	
	else if grid_y-1>0&&tile_owner[grid_x,grid_y-1]=1&&tile_type[grid_x,grid_y-1]=0	grid_y-=1
	else if grid_y+1>0&&tile_owner[grid_x,grid_y+1]=1&&tile_type[grid_x,grid_y+1]=0	grid_y+=1
	
}

if fade>=.01
fade-=.02
