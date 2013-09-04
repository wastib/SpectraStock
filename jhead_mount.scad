include <configuration.scad>
h=4.4;
r=12/2+.4; //J-head mount radius
$fn=10;


module J_Head_Mount(){

	difference(){
		union(){
			hull(){
				for(a = [0:120:240]){
					rotate([0,0,a]) translate([0,20,0]) cylinder( r=4, h=h,center=true);
				}
			}
		}

		//Bolt holes
		for(a = [0:120:240]){
			rotate([0,0,a]) translate([0,20,0]) cylinder( r=2.2, h=h+1,center=true);
		}
	
		//Hotend hole w/ pathway thing
		cylinder(r=r,h=h+1,center=true);
		hull(){
			cylinder(r=r*.8,h=h+1,center=true);
			translate([0,-20,0]) cube([2*r,1,h+1],center=true);

		}

	}
}

J_Head_Mount();