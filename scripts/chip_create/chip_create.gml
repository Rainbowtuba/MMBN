/// @function	(Folder Location, Chip Type, Chip Code)
/// @param		int       Folder Location
/// @param		int       Chip Type
/// @param		str       Chip Code



function chip_create()
{
	var arg0=argument0;
	var arg1=argument1;
	var arg2=argument2;
	
	chip_folder[# 0, arg0] = arg1;	chip_folder[# 1, arg0] = arg2;	
}